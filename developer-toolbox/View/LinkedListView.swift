//
//  LinkedListView.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 20.04.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import SwiftUI

struct LinkedListView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Text("Linked List View")
                }
                Spacer()
                Text(getStr())
            }
        }
//        249, 248, 248
        .navigationTitle("Linked List")
    }

    func getStr() -> AttributedString {
        let astr = try! AttributedString(markdown: codeDescription, options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace))
        for r in astr.runs {
            if let pi = r.presentationIntent {
                for i in pi.components {
                }
            }
        }
        return astr
    }
}

struct LinkedListView_Previews: PreviewProvider {
    static var previews: some View {
        LinkedListView()
    }
}


let linkedListDescription = """
    In [computer science](https://en.wikipedia.org/wiki/Computer_science), a **linked list** is a linear collection of data elements whose order is not given by their physical placement in memory. Instead, each element [points](https://en.wikipedia.org/wiki/Pointer_(computer_programming)) to the next. It is a [data structure](https://en.wikipedia.org/wiki/Data_structure) consisting of a collection of [nodes](https://en.wikipedia.org/wiki/Node_(computer_science)) which together represent a [sequence](https://en.wikipedia.org/wiki/Sequence). In its most basic form, each node contains: [data](https://en.wikipedia.org/wiki/Data_(computing)), and a [reference](https://en.wikipedia.org/wiki/Reference_(computer_science)) (in other words, a *link*) to the next node in the sequence. This structure allows for efficient insertion or removal of elements from any position in the sequence during iteration. More complex variants add additional links, allowing more efficient insertion or removal of nodes at arbitrary positions. A drawback of linked lists is that access time is linear (and difficult to [pipeline](https://en.wikipedia.org/wiki/Instruction_pipelining)). Faster access, such as random access, is not feasible. [Arrays](https://en.wikipedia.org/wiki/Array_data_structure) have better [cache locality](https://en.wikipedia.org/wiki/Locality_of_reference) compared to linked lists.

    Linked lists are among the simplest and most common data structures. They can be used to implement several other common [abstract data types](https://en.wikipedia.org/wiki/Abstract_data_type), including [lists](https://en.wikipedia.org/wiki/List_(abstract_data_type)), [stacks](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)), [queues](https://en.wikipedia.org/wiki/Queue_(abstract_data_type)), [associative arrays](https://en.wikipedia.org/wiki/Associative_array), and [S-expressions](https://en.wikipedia.org/wiki/S-expression), though it is not uncommon to implement those data structures directly without using a linked list as the basis.

    The principal benefit of a linked list over a conventional [array](https://en.wikipedia.org/wiki/Array_data_structure) is that the list elements can be easily inserted or removed without reallocation or reorganization of the entire structure because the data items need not be stored [contiguously](https://en.wiktionary.org/wiki/contiguous) in memory or on disk, while restructuring an array at [run-time](https://en.wikipedia.org/wiki/Run_time_(program_lifecycle_phase)) is a much more expensive operation. Linked lists allow insertion and removal of nodes at any point in the list, and allow doing so with a constant number of operations by keeping the link previous to the link being added or removed in memory during list traversal.

    On the other hand, since simple linked lists by themselves do not allow [random access](https://en.wikipedia.org/wiki/Random_access) to the data or any form of efficient indexing, many basic operations—such as obtaining the last node of the list, finding a node that contains a given datum, or locating the place where a new node should be inserted—may require iterating through most or all of the list elements. The advantages and disadvantages of using linked lists are given below.
"""

let codeDescription = """
```swift
    let a: LinkedList = LinkedList()
    print(a)
```
"""


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
