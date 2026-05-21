//
//  ObservationProfileView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 21.04.2026.
//

import Observation
import SwiftUI
import WebKit

@Observable
final class ProfileViewModel {
    var name: String
    var age: Int
    var city: String

    init(name: String, age: Int, city: String) {
        self.name = name
        self.age = age
        self.city = city
    }

    var profileData: String {
        "\(name), \(age), \(city)"
    }

    func birthday() {
        age += 1
    }
}

struct ObservationProfileView: View {
    @State private var viewModel = ProfileViewModel(name: "Jack", age: 21, city: "Moscow")

    var body: some View {
//        VStack(spacing: 16) {
//            Text(viewModel.profileData)
//            TextField("Name", text: $viewModel.name)
//                .textFieldStyle(.roundedBorder)
//            TextField("City", text: $viewModel.city)
//                .textFieldStyle(.roundedBorder)
//            Button("Birthday") {
//                viewModel.birthday()
//            }
//        }
        WebView(url: URL(string: "https://onliner.by/")!)
            .ignoresSafeArea()
    }
}

#Preview {
    ObservationProfileView()
}

struct WebView: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
