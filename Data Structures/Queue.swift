//
//  Queue.swift
//  
//
//  Created by Ernani Raffo on 4/3/23.
//

import Foundation
import SwiftUI

let initial_queue = Queue([1, 2])

struct Queue {
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
        if (self.items.count > 0) {
            self.items.remove(at: 0)
        }
    }
}

struct QueueView: View {
    @State var q = initial_queue
    
    var body: some View {
        VStack {
            ForEach(self.q.items, id: \.id, content: { node in
                Text("\(node.val)" as String)
                    .modifier(NodeView())
            })
            HStack {
                Button("Push") {
                    withAnimation(.linear) {
                        self.q.push(self.q.items.count + 1)
                    }
                }
                .padding()
                
                Button("Pop") {
                    withAnimation(.easeOut) {
                        self.q.pop()
                    }
                }
                .padding()
            }
        }
    }
}
