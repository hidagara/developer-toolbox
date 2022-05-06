//
//  TimeManagementWidget.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 29.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct TimeManagementWidget: View {

    // MARK: Config

    private let timePoolInSeconds: Float = 57600.0
    private let wakeUpTime: String = "05:00"
    private let sleepTime: String = "21:00"

    // MARK: Observables

    @State private var progressValue: Float = 0.0
    @State private var secondsLeft: Int = Self.endDate.seconds(from: Date())
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    static let endDate: Date = {
        let day = Date().get(.day)
        let month = Date().get(.month)
        let year = Date().get(.year)
        return DateComponents(calendar: .current, year: year, month: month, day: day, hour: 22, minute: 0, second: 0).date!
    }()

    var body: some View {
        VStack {
            Text("Time Remaining").font(.title).bold()
            TimeCircleProgressBar(progress: self.$progressValue, secondsLeft: $secondsLeft, secondsAmount: Int(timePoolInSeconds) , endDate: Self.endDate)
                .frame(width: 120.0, height: 120.0)
                .padding(.bottom, 16.0)
                .onReceive(timer) { _ in
                    let startDate = Date()
                    progressValue = Float(Self.endDate.seconds(from: startDate)) / timePoolInSeconds
                    secondsLeft = Self.endDate.seconds(from: Date())
                }
            HStack {
                VStack {
                    Image(systemName: "sunrise.fill").foregroundColor(Color(hex: "FFE347"))
                    Text(wakeUpTime)
                        .font(.caption2).bold()
                        .padding(.top, 8.0)
                }
                Spacer()
                VStack {
                    Image(systemName: "sunset.fill").foregroundColor(Color(hex: "EF767A"))
                    Text(sleepTime)
                        .font(.caption2).bold()
                        .padding(.top, 8.0)
                }
            }.padding([.leading, .trailing], 16.0)
            HStack {
                Text("Sprint 1 May - 15 May").font(.caption).bold()
                Spacer()
            }
            HStack {
                Text("Build Discipline").font(.caption).bold()
                Spacer()
            }
            Spacer()
        }
    }
}

struct TimeManagementWidget_Previews: PreviewProvider {
    static var previews: some View {
        TimeManagementWidget()
    }
}
