//
//  TodoList.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 29.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct TodoListWidget: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Working")
            Text("Read")
            Text("Sport")
            Text("Diet")
            Text("REJECT MODERNITY")
        }.font(.title3)
    }
}

struct TodoListWidget_Previews: PreviewProvider {
    static var previews: some View {
        TodoListWidget()
    }
}
