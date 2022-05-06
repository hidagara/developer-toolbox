//
//  GoalsWidget.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 29.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct GoalsWidget: View {
    @State var npf: Float = 0 // 30 Target

    @FetchRequest(
        entity: Habit.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Habit.title, ascending: true)
        ]
    ) var habits: FetchedResults<Habit>

    func incrementProgress() {
        let randomValue = Float([0.012, 0.022, 0.034, 0.016, 0.11].randomElement()!)
        self.npf += 1
    }

    var challenges: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HabitProgressRow(value: $npf).frame(height: 20)
                    Text("My chlng" \(Int(npf))/30").font(.caption2).bold()
                }
                Button(action: {
                    self.incrementProgress()
                }) {
                    HStack {
                        Image(systemName: "plus.rectangle.fill").font(.caption2)
                    }
                    .padding(8.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
            }
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HabitProgressRow(value: $npf).frame(height: 20)
                    Text("Reading \(Int(npf))/30").font(.caption2).bold()
                }
                Button(action: {
                    self.incrementProgress()
                }) {
                    HStack {
                        Image(systemName: "plus.rectangle.fill").font(.caption2)
                    }
                    .padding(8.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
            }
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    HabitProgressRow(value: $npf).frame(height: 20)
                    Text("Sport \(Int(npf))/30").font(.caption2).bold()
                }
                Button(action: {
                    self.incrementProgress()
                }) {
                    HStack {
                        Image(systemName: "plus.rectangle.fill").font(.caption2)
                    }
                    .padding(8.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
            }
        }
    }

    var body: some View {
        VStack {
            Text("Goals 2023").font(.title).bold()
            VStack {
                HStack {
                    Text("Mobile Team Lead")
                        .font(.caption)
                        .bold()
                        .padding()
                        .frame(width: 100, height: 90)
                        .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(hex: "3A7CA5")))
                    Spacer()
                    Text("Salary 6000$")
                        .font(.caption)
                        .bold()
                        .padding()
                        .frame(width: 75, height: 90)
                        .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(hex: "F9DC5C")))
                }
                HStack {
                    Text("English Language")
                        .font(.caption)
                        .bold()
                        .padding()
                        .frame(width: 100, height: 90)
                        .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(hex: "9FFFCB")))
                    Spacer()
                    Text("Weight 85kg")
                        .font(.caption)
                        .bold()
                        .padding()
                        .frame(width: 75, height: 90)
                        .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(hex: "F9DC5C")))
                }
                Text("Immigration")
                    .font(.caption)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 90)
                    .frame(height: 90)
                    .background(RoundedRectangle(cornerRadius: 8.0).fill(Color(hex: "FEFFA5")))
                Spacer()
            }.padding(.leading, 8.0)
        }
    }
}

struct GoalsWidget_Previews: PreviewProvider {
    static var previews: some View {
        GoalsWidget()
    }
}
