//
//  NavigationExampleView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 9.04.26.
//

import SwiftUI

struct NavigationExampleView: View {

    var body: some View {
        NavigationStack { // Обертка, которая позволяет осуществлять навигацию
            NavigationLink("Details") { // ЧТО мы нажмем, чтобы перейти на экран назначения
                DetailsView()
            }
//            .navigationTitle("Home")

            NavigationLink {
                DetailsView()
            } label: {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.yellow)
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 150, height: 50)
                    .overlay {
                        Text("Push")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
            }

        }
    }
}

struct DetailsView: View {
    var body: some View {
        Text("Details screen") // ЭТО экран назначения
//            .navigationTitle("Details")
    }
}



#Preview {
    NavigationExampleView()
}



///     NavigationStack {
///         List(parks) { park in
///             NavigationLink(park.name, value: park)
///         }
///         .navigationDestination(for: Park.self) { park in
///             ParkDetails(park: park)
///         }
///     }
