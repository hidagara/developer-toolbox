//
//  HabitsTrackerView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 23.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI
import Combine

struct HabitsTrackerView: View {
    @State var progressValue: Float = 0.0
    @State var connectedTimer: Cancellable? = nil

    static let stackDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM HH:mm"
        return formatter
    }()

    static let relativeFormatter: RelativeDateTimeFormatter = {
        let relativeFormatter = RelativeDateTimeFormatter()
        relativeFormatter.unitsStyle = .full
        return relativeFormatter
    }()

    @State var timer = Timer.publish(every: 1, on: .main, in: .common)

    var braindWidget: some View {
        VStack {
            Text("Information Input").font(.largeTitle)
            HStack {
                Image(systemName: "arrow.down")
                Image(systemName: "arrow.down")
                Image(systemName: "arrow.down")
            }
            Image(systemName: "brain")
                .font(.system(size: 60.0))
                .foregroundColor(Color(hex: "EE92C2"))
            Text("We are what\nWe are repeatedly do")
        }
    }


    var dailyActivities = [
        "Vacuum",
        "Running",
        "English",
        "Gym",
        "LeetCode",
        "Working",
    ]

    var dailySchedule: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            HStack {
                Text("Daily Schedule")
                .font(.largeTitle).bold()
                Spacer()
            }
            ForEach(dailyActivities, id: \.self) { elem in
                Text("\(elem)").font(.title3).bold()
            }
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    GoalsWidget()
                    Spacer()
                    TimeManagementWidget()
                }
                Spacer()
                ConcentrationView(progress: $progressValue, didTapStop: {
                    progressValue = 0
                    connectedTimer?.cancel()
                }, didTapStart: {
                    timer = Timer.publish(every: 1, on: .main, in: .common)
                    connectedTimer = timer.connect()
                }).onReceive(timer) { _ in
                        progressValue += 1
                }
                dailySchedule.padding([.leading, .trailing], 8.0)
            }
        }
        .padding(.bottom, 16.0)
        .navigationBarTitleDisplayMode(.inline)
    }
}
struct HabitsTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsTrackerView()
    }
}

extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
