//
//  ListExample3.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 7.04.26.
//

import SwiftUI

struct ListExample3: View {

    var body: some View {
        List {
            Section("Фрукты") {
                Text("Апельсин")
                Text("Яблоко")
                Text("Земляника")
                Text("Банан")
            }

            Section("Овощи") {
                Text("Помидор")
                Text("Огурец")
                Text("Капуста")
            }
        }
    }
}

#Preview {
    ListExample3()
}

