//
//  DietView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 27.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct DietView: View {
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading) {
                Text("БЖУ")
                Text("200g - Protein, 70g Fat/Carbo")
                Text("Total Calories = 1400 KCal")
                ForEach(1..<2) { _ in
                    Text("Куриная грудка - 31g Protein, 3,6g Fat, 0g Carbo")
                    Text("Овсяная каша - 31g Protein, 3,6g Fat, 0g Carbo")
                    Text("Яйцо - 31g Protein, 3,6g Fat, 0g Carbo")
                    Text("Творог - 31g Protein, 3,6g Fat, 0g Carbo")
                    Text("Протеин - 31g Protein, 3,6g Fat, 0g Carbo")
                    Text("Тунец - 31g Protein, 3,6g Fat, 0g Carbo")
                }
            }
        }

    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}
