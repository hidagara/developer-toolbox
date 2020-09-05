//
//  ContentView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 16.05.2020.
//  Copyright © 2020 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let themes: [String] = ["All", "WWDC 2019", "WWDC 2020", "Apple Frameworks", "Swift", "XCode", "Common"]
    var body: some View {
        HStack {
            List {
                ForEach(themes, id: \.self, content: { theme in
                    InfoCardView(theme: theme)
                })
            }.frame(width: 150)
            Spacer()
            PreviewInfo()
            Spacer()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct InfoCardView: View {
    let theme: String
    var body: some View {
        Text(theme)
    }
}

struct PreviewInfo: View {
    var body: some View {
        Text("Here we are")
            .foregroundColor(.blue)
            .background(Color(.red))
    }
}

