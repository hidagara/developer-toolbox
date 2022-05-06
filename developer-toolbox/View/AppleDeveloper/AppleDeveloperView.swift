//
//  AppleDeveloperView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 24.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct AppleDeveloperSectionInfo: Identifiable {
    var id = UUID()

    let title: String
}

/*
    Swift Language

    Architecture Patterns -> MVVM, MVC, Clean Swift, VIPER

    Apple Frameworks

    LeetCode Tasks

    Algorithms

    Data Structures

    Compputer Science
 */

struct AppleDeveloperView: View {
    var info: [AppleDeveloperSectionInfo] = [
        .init(title: "Swift Language")
    ]

    var body: some View {
        ScrollView {
            ForEach(info) { elem in
                HStack {
                    Text(elem.title)
                    Spacer()
                }
            }
        }.background(Color(hex: "2C1320"))
//        List {
//            NavigationLink(destination: SwiftLanguageView()){
//                Text("Swift Language")
//            }
//            Text("UIKit")
//            Text("SwiftUI")
//            Text("Combine")
//            Text("AsyncSequence")
//            Text("Operation API")
//            Text("Dispatch Queue")
//        }
    }
}

struct AppleDeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        AppleDeveloperView()
    }
}
