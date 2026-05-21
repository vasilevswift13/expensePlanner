//
//  LoadingDotsView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 07.05.2026.
//

import SwiftUI

struct LoadingDotsView: View {
    @State private var isActive = false

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<10) { index in
                Circle()
                    .fill(.blue)
                    .frame(
                        width: 20,
                        height: 20
                    )
                    .scaleEffect(isActive ? 1.0 : 0.5)
                    .animation(
                        .easeInOut(duration: 0.6)
                        .repeatForever()
                        .delay(Double(index) * 0.1),
                        value: isActive
                    )
            }
        }
        .onAppear {
            isActive = true
        }
    }
}
