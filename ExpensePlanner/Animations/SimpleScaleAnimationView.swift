//
//  SimpleScaleAnimationView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 07.05.2026.
//

import SwiftUI

struct SimpleScaleAnimationView: View {
    @State private var isScaled = false

    var body: some View {
        VStack {
            Circle()
                .fill(.blue)
                .frame(
                    width: isScaled ? 200 : 100,
                    height: isScaled ? 200 : 100
                )
            Button("Animate") {
                withAnimation {
                    isScaled.toggle()
                }
            }
        }
        .padding()
    }
}
