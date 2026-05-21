//
//  TransitionExampleView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 07.05.2026.
//

import SwiftUI

struct TransitionExampleView: View {
    @State private var isActive = false

    var body: some View {
        VStack() {
            Button("Animate") {
                withAnimation(.spring()) {
                    isActive.toggle()
                }
            }
            if isActive {
                Text("Hello World")
                    .font(.title.bold())
                    .padding()
                    .background(.blue.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .transition(.scale.combined(with: .opacity))
            }
            Spacer()
        }
        .padding()
    }
}
