//
//  LikeButtonAnimationView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 07.05.2026.
//

import SwiftUI

struct LikeButtonAnimationView: View {
    @State private var isLiked = false
    @State private var scale = 1.0

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size: 72))
                .foregroundStyle(isLiked ? .red : .gray)
                .scaleEffect(scale)
                .onTapGesture {
                    isLiked.toggle()

                    withAnimation(.spring(response: 0.35, dampingFraction: 0.35)) {
                        scale = 1.4
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.6)) {
                            scale = 1.0
                        }
                    }
                }

            Text(isLiked ? "Liked" : "Tap heart")
                .font(.headline)
        }
    }
}
