//
//  WrapperExampleView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 23.04.2026.
//

import SwiftUI

struct User: Identifiable, Codable {
    var id = UUID()
    var name: String
    var age: Int

    init(id: UUID = UUID(), name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}

struct WrapperExampleView: View {
                // key                            // value
    @AppStorage("username") private var username = "Guest"

    @Stored("user") private var user = User(name: "John", age: 20)

    var body: some View {
        VStack(spacing: 16) {
            Text("Name: \(user.name)")
            Text("Age: \(user.age)")

            TextField(
                "Enter name",
                text: Binding(
                    get: { user.name },
                    set: { user.name = $0 }
                )
            )
            .textFieldStyle(.roundedBorder)

            Stepper("Age: \(user.age)", value: Binding(
                get: { user.age },
                set: { user.age = $0 }
            ), in: 0...120)

            Button("Save") {
                user = user
            }
        }
    }
}

#Preview {
    WrapperExampleView()
}
