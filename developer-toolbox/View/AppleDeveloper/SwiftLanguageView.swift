//
//  SwiftLanguageView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 24.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct SwiftLanguageView: View {

    var body: some View {
        ScrollView {
            ForEach(1..<10) { elem in
                HStack {
                    SwiftLanguageRow(title: "ARC", isExpanded: false)
                        .foregroundColor(Color.red)
                        .background(Color.gray)
                        .onTapGesture {
                            print("Selected")
                        }
                    Spacer()
                }
            }
            .padding()
            .background(Color.yellow)
        }
        .padding()
        .background(Color.green)
        //        List {
//            Text("Variables,Constants And Properties")
//            Text("ARC")
//            Text("Enum")
//            Text("Struct")
//            Text("Class")
//            Text("Generics")
//        }
    }
}

struct SwiftLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLanguageView()
    }
}

struct SwiftLanguageRow: View {
    let title: String
    let isExpanded: Bool
    var body: some View {
        VStack {
            HStack {
                Text("\(title)")
                Spacer()
            }
            if isExpanded {
                VStack {
                    Text("HERE GOES A TEXT")
                }
            }
        }
    }
}
