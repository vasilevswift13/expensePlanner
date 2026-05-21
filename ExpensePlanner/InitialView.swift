//
//  InitialView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 31.03.26.
//

import SwiftUI

struct InitialView: View {

    private var x = 5 // stored property

    var body: some View { // computed property
        HStack {
            Button("+") {

            }
            .padding(.leading, 20)
            Spacer()
            Text("Какое-то пиво")
            Spacer()
            Button("-") {

            }
            .padding(.trailing, 20)
        }
        .cardStyle()
    }
}

#Preview {
    InitialView()
}

