//
//  BindingListView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 9.04.26.
//

import SwiftUI

struct Drink: Identifiable {
    let id = UUID()
    let name: String
    var isFavorite: Bool
}

struct BindingListView: View {

    @State private var favoriteSelected = false
    @State private var drinks: [Drink] = [
        Drink(name: "Whisky", isFavorite: true),
        Drink(name: "Whiskey", isFavorite: false),
        Drink(name: "Gin", isFavorite: true),
        Drink(name: "Vodka", isFavorite: false),
        Drink(name: "Tequila", isFavorite: false),
        Drink(name: "Ooza", isFavorite: false),
        Drink(name: "Beer", isFavorite: false),
        Drink(name: "Cognac", isFavorite: false)
    ]

    var body: some View {
        VStack {
            ToggleView(favoriteSelected: $favoriteSelected)
            List {
                if favoriteSelected {
                    ForEach($drinks.filter { $0.isFavorite.wrappedValue } ) { $drink in
                        DrinkRow(drink: $drink)
                    }
                } else {
                    ForEach($drinks) { $drink in
                        DrinkRow(drink: $drink)
                    }
                }
            }
        }
    }
}

struct DrinkRow: View {

    @Binding var drink: Drink

    var body: some View {
        HStack {
            Text(drink.name)
                .padding(.leading)
            Spacer()
            Toggle(isOn: $drink.isFavorite) {}
        }
    }
}

struct ToggleView: View {
    @Binding var favoriteSelected: Bool

    var body: some View {
        Toggle(isOn: $favoriteSelected) {
            Text("Show favorite only")
        }
        .padding(.horizontal)
    }
}

#Preview {
    BindingListView()
}

