//
//  Data Structures.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 19.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct DataStructuresView: View {

    let articlesData = [
        "Array",
        "Contagious Array",
        "Linked List",
        "Queue",
        "Stack",
        "Hash Table",
        "Trees",
        "Binary Search Tree",
        "Binary Tree",
        "AVL Tree",
        "B-Tree",
        "B+ Tree",
        "Red Black Tree",
        "Heap",
        "Graphs",
        "Directed Graph",
        "Undirected Graph",
        "Spanning Tree and Minimum Spanning Tree",
        "Strongly Connected Components",
        "Adjacency Matrix",
        "Adjacency List"
    ]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(articlesData, id: \.self, content: { elem in
                    Text(elem)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                        .background(Color.red)
                        .cornerRadius(8)
                })
                Text("ALALALALLALALALALLAALALALALALALLALALALALLAALALLALALALALLAALALALALLALALALALLAALALALALLALALALALLAALALALALLALALALALLAALALALALLALALALALLAALALALALLALALALALLAALALALALLALALALALLAALALALALLALALALALLAALALALALLALALALALLAALALALALLALALALALLAALALALALLALALALALLA")
                    .font(.caption)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
    }
}

struct DataStructuresView_Previews: PreviewProvider {
    static var previews: some View {
        DataStructuresView()
    }
}
