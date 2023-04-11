//
//  File.swift
//  
//
//  Created by Ernani Raffo on 4/10/23.
//

import Foundation
import SwiftUI

struct ArrayGenerator {
    var a: [Node] = []
    var updated: Bool = false
    
    init() {
        for _ in 1...6 {
            a.append(Node(Int.random(in: 0...99)))
        }
    }
    
    mutating func regenerate() {
        for i in 1...6 {
            a[i-1].val = Int.random(in: 0...99)
        }
        updated.toggle()
    }
    
}

struct InsertionSortView: View {
    @State var sorter = ArrayGenerator()
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(self.sorter.a, id: \.id) { node in
                    Text("\(node.val)")
                        .modifier(NodeView())
                }
            }
            .padding()
            VStack {
                Button("Sort") {
                    var i = 1
                    var delay = 0.0
                    while i < self.sorter.a.count {
                        var j = i
                        while j > 0 && self.sorter.a[j - 1].val > self.sorter.a[j].val {
                            withAnimation(.linear(duration: 1.0).delay(delay)) {
                                self.sorter.a.swapAt(j-1, j)
                            }
                            delay += 1
                            j -= 1
                        }
                        i += 1
                    }
                }
                .padding()
                Button("Generate new array") {
                    self.sorter.regenerate()
                }
                .padding()
            }
        }
    }
}
