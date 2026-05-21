//
//  SlideAnimationView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 07.05.2026.
//

import SwiftUI

struct SlideAnimationView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            VStack() {
                Button("Animate") {
                    withAnimation(.spring()) {
                        isActive = true
                    }
                }
                GeometryReader { geometry in
                    Text("Top panel")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity)
                        .frame(height: geometry.size.height / 10)
                        .background(.blue.opacity(0.2))
                }
                Spacer()
            }
            if isActive {
                VStack(spacing: 20) {
                    Text("Bottom panel")
                        .font(.title.bold())
                    Button("Close") {
                        withAnimation {
                            isActive = false
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: UIScreen.main.bounds.height / 2)
                .background(.blue.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}
