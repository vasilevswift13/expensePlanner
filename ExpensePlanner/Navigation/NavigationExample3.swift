//
//  NavigationExample3.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 14.04.2026.
//

import SwiftUI

enum Route: Hashable {
    case details(id: Int)
    case profile(name: String)
    case settings
}

enum Tab: Hashable {
    case navigation
    case another
    case grid
}

struct TabBarExampleView: View {

    @State private var selectedTab: Tab = .navigation

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationExample3View()
                .tabItem {
                    Label("Navigation", systemImage: "house")
                }
                .tag(Tab.navigation)
            ListExample3()
                .tabItem {
                    Label("List", systemImage: "star")
                }
                .tag(Tab.another)
            GridExampleView()
                .tabItem {
                    Label("Grid", systemImage: "square.grid.2x2")
                }
                .tag(Tab.grid)
        }
    }
}

struct NavigationExample3View: View {

    @State private var path = NavigationPath()
    @State private var isModalPresented = false
    @State private var isFullModalPresented = false

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 16) {
                Button("Open settings") {
                    path.append(Route.settings)
                }
                Button("Open profile Alex") {
                    path.append(Route.profile(name: "Alex"))
                }
                Button("Open details 42") {
                    path.append(Route.details(id: 42))
                }
                Button("Open ALL") {
                    path.append(Route.settings)
                    path.append(Route.profile(name: "Alex"))
                    path.append(Route.details(id: 42))
                }
                Button("Open modal screen") {
                    isModalPresented = true
                }
                .sheet(isPresented: $isModalPresented, content: {
                    ModalView()
                })
                Button("Open fullscreen modal screen") {
                    isFullModalPresented = true
                }
                .fullScreenCover(isPresented: $isFullModalPresented, content: {
//                    FullModalView()
                    ModalView()
                })
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .settings:
                    SettingsView()
                        .toolbar(.hidden, for: .navigationBar)
                case .details(let id):
                                //  Binding  State из этой структуры
                    DetailsByIDView(newPath: $path, id: id)
                        .toolbar(.hidden, for: .navigationBar)
                case .profile(let name):
                    ProfileView(name: name)
                }
            }
        }
    }
}

struct SettingsView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Button("Back") {
                dismiss()
            }
            Text("Settings")
                .navigationTitle("Settings")
        }
    }
}

struct DetailsByIDView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var newPath: NavigationPath // ссылка на @State path
    let id: Int

    var body: some View {
        VStack(spacing: 16) {
            Button("Back to root") {
                newPath = NavigationPath() // стереть все в @State path
            }
            Text("ID = \(id)")
            Button("Back") {
                dismiss()
            }
        }
        .navigationTitle("Details")
    }
}

struct ProfileView: View {
    let name: String

    var body: some View {
        VStack(spacing: 16) {
            Text("Профиль: \(name)")
        }
        .navigationTitle("Profile")
    }
}

struct ModalView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Button("Back") {
                dismiss()
            }
            Text("Modal view")

        }
        .navigationTitle("MODAL")
    }
}

struct FullModalView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Button("Back") {
                dismiss()
            }
            Text("FullScreen Modal view")

        }
        .navigationTitle("FullScreen MODAL")
    }
}

#Preview {
    TabBarExampleView()
}
