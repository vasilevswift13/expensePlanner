//
//  StackItem.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 31.03.26.
//

import SwiftUI

struct StackItem: View {
    let text: String

    var body: some View {
        HStack() {
            Image(systemName: "star")
                .foregroundStyle(.orange)
                .padding(.leading)
            Image(systemName: "star")
                .foregroundStyle(.orange)
            Image(systemName: "star")
                .foregroundStyle(.orange)
            Image(systemName: "star")
                .foregroundStyle(.orange)
            Image(systemName: "star")
                .foregroundStyle(.orange)
                .padding(.trailing)
            Text(self.text)
                .padding(.trailing)
        }
        .padding(8)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(16)
    }
}

#Preview {
    StackItem(text: "Some text")
        .frame(width: 375, height: 100)
}
