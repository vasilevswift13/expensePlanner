//
//  DrinkStackView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 2.04.26.
//

import SwiftUI

struct DrinkStackView: View {

    @State private var array = [
        "Whisky",
        "Gin",
        "Tequila",
        "Vodka",
        "Wine"
    ]

    var body: some View {
        VStack {
            ScrollView {
                ForEach(array.indices, id: \.self) { index in
                    DrinkItem(text: array[index])
                }
            }

            Spacer()
            Button {
                array.append(UUID().uuidString)
            } label: {
                HStack {
                    Image(systemName: "globe")
                    Text("Tap me")
                }
            }
            .padding(.vertical)
            .disabled(array.count > 15)

        }
    }
}

#Preview {
    DrinkStackView()
}

struct DrinkItem: View {
    let text: String

    var body: some View {
        Text(text)
            .padding(.vertical, 8)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(16)
            .padding(.horizontal)
            .onTapGesture {
                printText()
            }
    }

    private func printText() {
        print(text)
    }
}
