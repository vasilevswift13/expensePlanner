//
//  MultipropertyAnimationView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 07.05.2026.
//

import SwiftUI

struct MultipropertyAnimationView: View {
    @State private var isActive = false

    var body: some View {
        VStack(spacing: isActive ? 100 : 8) {
            RoundedRectangle(cornerRadius: isActive ? 40 : 10)
                .fill(isActive ? .orange : .blue)
                .frame(
                    width: isActive ? 200 : 100,
                    height: isActive ? 200 : 100
                )
                .rotationEffect(.degrees(isActive ? 180 : 0))
                .opacity(isActive ? 0.7 : 1)
            Button("Animate") {
                withAnimation(.easeInOut(duration: 1)) {
                    isActive.toggle()
                }
            }
        }
    }
}
