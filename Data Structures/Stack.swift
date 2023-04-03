//
//  Stack.swift
//  Algorithms and Data Structures
//
//  Created by Ernani Raffo on 3/30/23.
//

import Foundation
import SwiftUI

let initial_stack = Stack([1, 2])

struct Stack {
    var items: [Node] = []
    
    init(_ items: [Int] = []) {
        for item in items {
            self.items.append(Node(item))
        }
    }
    
    mutating func push(_ item: Int) -> Void {
        self.items.append(Node(item))
    }
    
    mutating func pop() -> Void {
        _ = self.items.popLast()
    }
}

struct StackView: View {
    @State var stack = initial_stack
    
    var body: some View {
        VStack {
            ForEach(self.stack.items.reversed(), id: \.val, content: { node in
                Text("\(node.val)" as String)
                    .modifier(NodeView())
            })
            HStack {
                Button("Push") {
                    withAnimation(.default) {
                        self.stack.push(self.stack.items.count + 1)
                    }
                }
                .padding()
                
                Button("Pop") {
                    withAnimation(.default) {
                        self.stack.pop()
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}
