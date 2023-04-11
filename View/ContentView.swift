

import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Stack", destination: StackView())
                NavigationLink("Queue", destination: QueueView())
            }
        }
    }
}
