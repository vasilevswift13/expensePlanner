//
//  BindingExampleView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 9.04.26.
//

import SwiftUI

struct BindingExampleView: View {

    @State private var isFavorite = false
    @State private var text = ""

    var body: some View { // computed property
        VStack {
            Text(text)
                .padding()
            Text(isFavorite ? "Избранное" :"Не избранное")
            FavoriteButton(isFavorite: $isFavorite, text: $text)
        }
    }
}

struct FavoriteButton: View {
    @Binding var isFavorite: Bool
    @Binding var text: String

    var body: some View {
        Button("Select") {
            isFavorite.toggle()

            if text.isEmpty {
                text = "A"
            } else {
                text += "A"
            }
        }
        .padding()
    }
}


#Preview {
    BindingExampleView()
}

