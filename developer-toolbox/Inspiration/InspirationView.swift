//
//  InspirationView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 29.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct InspirationView: View {
    var body: some View {
        ScrollView {
            Image("body")
                .resizable()
                .scaledToFill()
            Image("home")
                .resizable()
                .scaledToFill()
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
    }
}
