//
//  ConcentrationView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 30.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct ConcentrationView: View {
    @Binding var progress: Float
    var totalTarget: Float = 5 * 60 // 45 Minutes
    @State private var viewId = 0

    var didTapStop: (() -> Void)
    var didTapStart: (() -> Void)
    @State private var isConcentrating = false
    @State var myAngle: Float = 360
    var animation: Animation {
        Animation.linear(duration: 1.5)
            .speed(1)
        .repeatForever(autoreverses: false)
    }

    var body: some View {
        HStack {
            circle
            Spacer()
            VStack(alignment: .leading) {
                Text("The Concentrator")
                HStack {
                    Text("Current")
                    Text("Goal")
                }
                HStack {
                    Button(action: {
                        isConcentrating = true
                        myAngle = 0
                        progress = 0
                        didTapStart()
                        viewId = 0
                    }) {
                        HStack {
                            Image(systemName: "clock.arrow.circlepath").font(.caption2)
                        }
                        .padding(8.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(lineWidth: 2.0)
                        )
                    }
                    Button(action: {
                        isConcentrating = false
                        myAngle = 270
                        progress = 0
                        didTapStop()
                        viewId = 1
                    }) {
                        HStack {
                            Image(systemName: "stopwatch.fill").font(.caption2)
                        }
                        .padding(8.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(lineWidth: 2.0)
                        )
                    }
                }
                Text("Target - 45 Minutes")
                NavigationLink(destination: WorkoutView(), label: {
                    Text("History")
                })
            }
        }
        .padding([.leading,.trailing], 16.0)
        .onAppear(perform:  {
        })
    }

    var circle: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15.0)
                .opacity(0.3)
                .foregroundColor(Color(hex: "25A18E"))
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress/totalTarget, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .miter))
                .foregroundColor(Color(hex: "7AE582"))
                .rotationEffect(Angle.degrees(Double(myAngle)))
                .animation(animation, value: isConcentrating)
                .id(viewId)
            VStack {
                Text(String(format: "%.1f %%", min(self.progress/totalTarget, 1.0)*100.0))
                    .font(.title3)
                    .bold()
            }
        }.frame(width: 120.0, height: 120.0)
    }
}

struct ConcentrationView_Previews: PreviewProvider {
    static var previews: some View {
        ConcentrationView(progress: .constant(0.3), didTapStop: {}, didTapStart: {})
    }
}
