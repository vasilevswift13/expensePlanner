//
//  ListExample1.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 7.04.26.
//

import SwiftUI

struct ListExample1: View {

    @State var fruits = [
        "Apple",
        "Orange",
        "Banana",
        "Mango",
        "Cherry",
        "Apple"
    ]

    @State var newFruit: String = ""
    @FocusState private var isFocused: Bool

    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                ListItem(text: fruit)
            }
            .onDelete(perform: deleteItems(at:))
        }
        .scrollDismissesKeyboard(.immediately)
        .onTapGesture {
            isFocused = false
        }

        Spacer()
        TextField("Add new fruit", text: $newFruit)
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($isFocused)
        Button("Add") {
            fruits.append(newFruit)
            newFruit = ""
        }
    }

    func deleteItems(at offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }
}

struct ListItem: View {
    let text: String

    var body: some View {
        Text(text)
    }
}


#Preview {
    ListExample1()
}

