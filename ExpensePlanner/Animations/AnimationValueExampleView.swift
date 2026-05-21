//
//  AnimationValueExampleView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 07.05.2026.
//

import SwiftUI

struct AnimationValueExampleView: View {
    @State private var isScaled = false

    var body: some View {
        VStack(spacing: 10) {
            Circle()
                .fill(.red)
                .frame(
                    width: 120,
                    height: 120
                )
                .scaleEffect(isScaled ? 2.0 : 1.0)
                .animation(.easeInOut(duration: 1), value: isScaled)
            Button("Animate") {
                isScaled.toggle()
            }
        }
        .padding()
    }
}
