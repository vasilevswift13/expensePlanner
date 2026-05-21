//
//  NavigationExample2View.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 9.04.26.
//

import SwiftUI

struct NavigationExample2View: View {

    let topics = [
        "Stacks / View",
        "@State",
        "List / LazyVGrid",
        "Navigation"
    ]

    var body: some View {
        NavigationStack {
            List(topics, id: \.self) { topic in
                NavigationLink(topic) {
                    TopicView(topic: topic)
                }
            }
        }
    }
}

struct TopicView: View { // КУДА переходим
    let topic: String

    var body: some View {
        Text("сегодня проходим \(topic)")
    }
}



#Preview {
    NavigationExample2View()
}



///     NavigationStack {
///         List(parks) { park in
///             NavigationLink(park.name, value: park)
///         }
///         .navigationDestination(for: Park.self) { park in
///             ParkDetails(park: park)
///         }
///     }
