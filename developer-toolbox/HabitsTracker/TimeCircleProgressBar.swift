//
//  TimeCircleProgressBar.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 29.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI
import AVFoundation

struct TimeCircleProgressBar: View {
    @Binding var progress: Float
    @Binding var secondsLeft: Int
    @State private var isRotated = false
    let secondsAmount: Int
    let endDate: Date

    var animation: Animation {
        Animation.linear(duration: 1.5)
            .speed(1)
        .repeatForever(autoreverses: false)
    }

    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State var myAngle: Int = 360

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.red)
                .rotationEffect(Angle.degrees(Double(myAngle)))
                .animation(animation, value: isRotated)//, value: 300)
                .onReceive(timer) { _ in
//                    isRotated = !isRotated
//                    myAngle += 360

                }
                .onAppear(perform: {
                    isRotated = true
                    myAngle = 0
                })
            VStack {
                Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                    .font(.title3)
                    .bold()
                Text("\(self.secondsLeft)")
                    .font(.caption2)
                Text("/")
                    .font(.caption2)
                Text("\(secondsAmount)")
                    .font(.caption2)
            }
        }
    }
}

struct TimeCircleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        TimeCircleProgressBar(progress: .constant(0.1), secondsLeft: .constant(1), secondsAmount: 111, endDate: Date())
    }
}
