//
//  WorkoutView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 27.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Morning").font(.largeTitle).bold()
                    Spacer()
                }
                Text("Vacuum - 5 Minutes")
                Text("Бег - 45 минут")
            }.font(.title3)

            VStack(alignment: .leading) {
                HStack {
                    Text("Monday").font(.largeTitle).bold()
                    Spacer()
                }
                Text("Подьем гантелей на бицепс - 20 kg 5 повторов по 6 раз")
                Text("Разгибания с гантелями на трипцепс - 15 kg 5 повторов по 6 раз")
            }.font(.title3)
        }
        .ignoresSafeArea()
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
