//
//  HabitProgressRow.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 29.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct HabitProgressRow: View {
    @Binding var value: Float

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(Color(UIColor.systemTeal))

                    Rectangle().frame(width: min(CGFloat(self.value/30.0)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.systemBlue))
                        .animation(.linear)
                }
                .cornerRadius(45.0)
            }
        }
    }
}

struct HabitProgressRow_Previews: PreviewProvider {
    static var previews: some View {
        HabitProgressRow(value: .constant(0.5))
    }
}
