//
//  GridExampleView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 9.04.26.
//

import SwiftUI

struct GridExampleView: View {

    let items = Array(1...100)

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(),
                    GridItem(),
                    GridItem()
                ],
                spacing: 16
            ) {
                ForEach(items, id: \.self) { item in
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay {
                            Text("\(item)")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                        }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}


#Preview {
    GridExampleView()
}
