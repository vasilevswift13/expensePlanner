//
//  RepeatingPulseView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 07.05.2026.
//

import SwiftUI

struct RepeatingPulseView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            Circle()
                .fill(.blue)
                .frame(
                    width: 100,
                    height: 100
                )
                .scaleEffect(isActive ? 0.5 : 1.0)
                .onAppear {
                    withAnimation(
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: true)
                    ) {
                        isActive = true
                    }
                }
        }
    }
}
