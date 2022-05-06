//
//  FinnhubView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 23.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct FinnhubView: View {
    let vm = SymbolsViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
        }
    }
}

struct FinnhubView_Previews: PreviewProvider {
    static var previews: some View {
        FinnhubView()
    }
}


class FinnhubModel {
    func fetchAPPLE() {
        let cs: CompanySymbol?
    }
}
