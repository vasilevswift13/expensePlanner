//
//  HorizontalScrollableView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 7.04.26.
//

import SwiftUI

struct HorizontalScrollableView: View {

    @State var colors: [Color] = [
        .red,
        .blue,
        .yellow,
        .green,
        .orange,
        .accentColor,
        .cyan,
        .red
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(colors.indices, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 16)
                        .fill(colors[index])
                        .frame(width: 200, height: 200)
                        .overlay {
                            Text("Card \(index + 1)")
                                .foregroundStyle(Color.white)
                                .bold()
                        }
                }
            }
        }
        Spacer()
        Button("Remove") {
            colors = colors.filter({ $0 != .red })
        }
    }
}

#Preview {
    HorizontalScrollableView()
}

