//
//  MyProfileView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 21.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("swift-background")
                    .resizable()
                    .scaledToFill()
                    .padding(.top, -44)
                NavigationLink(destination: FinnhubView()) {
                    Text("Hello world")
                }
                .buttonStyle(PlainButtonStyle())

                VStack(alignment: .leading) {
                    HStack {
                        Text("Roman Guseynov")
                            .font(.title)
                        Spacer()
                        Text("iOS Developer")
                            .font(.body)
                    }
                    HStack {
                        Text("Salary 6000 USD")
                            .font(.body)
                        Spacer()
                        Button("Hire Me", action: {
                        })
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            .background(Color(hex: "F3DE8A"))
                            .cornerRadius(5)
                    }
                    HStack {
                        Text("My Projects")
                            .font(.largeTitle)
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text("Lamoda App")
                        Text("Kuban Kredit App")
                        Text("Tinder Like App")
                        Text("Youtube and Twitch Like App")
                        Text("VTB Invest App")
                    }


                    HStack {
                        Text("My Tech Stack")
                            .font(.largeTitle)
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text("Swift Language")
                        Text("Core Data")
                        Text("UIKit")
                        Text("SwiftUI")
                        Text("Combine")
                        Text("AsyncSequence")
                    }

                    HStack {
                        Text("About Me")
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                Spacer()
            }
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
