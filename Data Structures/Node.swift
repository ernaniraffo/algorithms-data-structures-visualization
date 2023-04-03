//
//  Node.swift
//  Algorithms and Data Structures
//
//  Created by Ernani Raffo on 3/30/23.
//

import Foundation
import SwiftUI

class Node: Identifiable {
    var val: Int
    init(_ val: Int) {
        self.val = val
    }
}

struct NodeView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .background(Rectangle().fill(Color.white))
            .background(Rectangle().stroke())
            .padding(-5)
    }
}
