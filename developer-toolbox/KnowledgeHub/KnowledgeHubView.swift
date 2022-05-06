//
//  KnowledgeHubView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 24.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct KnowledgeHubView: View {
    var body: some View {
        VStack {
            CardView(cardTitle: "Необходимо повторить")
            NavigationLink(destination: AppleDeveloperView()) {
                CardView(cardTitle: "Apple Developer")
            }
            CardView(cardTitle: "English Language")
            CardView(cardTitle: "LeetCode Tasks")
            Spacer()
        }.padding([.leading, .trailing], 16.0)
    }
}

struct KnowledgeHubView_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeHubView()
    }
}
