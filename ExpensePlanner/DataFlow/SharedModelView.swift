//
//  SharedModelView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 16.04.2026.
//

import SwiftUI

final class SharedModel: ObservableObject { // ObservableObject - дает возможность отслеживать изменения в ссылочном типе
    @Published var text = "Hello" // @Published - изменения каких именно проперти нужно отслеживать
}

struct ParentSharedView: View {
    @StateObject private var model = SharedModel() // @StateObject - источник истины ссылочного типа для родительского View

    var body: some View {
        VStack(spacing: 16) {
            TextFieldAView(model: model)
            TextFieldBView(model: model)
            SharedTextView(model: model)
        }
    }
}

struct TextFieldAView: View {
    @ObservedObject var model: SharedModel // @ObservedObject - ссылка на @StateObject, объект создан не в этом View

    var body: some View {
        TextField("Text", text: $model.text)
            .textFieldStyle(.roundedBorder)
    }
}

struct TextFieldBView: View {
    @ObservedObject var model: SharedModel // @ObservedObject - ссылка на @StateObject, объект создан не в этом View

    var body: some View {
        TextField("Text", text: $model.text)
            .textFieldStyle(.roundedBorder)
    }
}

struct SharedTextView: View {
    @ObservedObject var model: SharedModel // @ObservedObject - ссылка на @StateObject, объект создан не в этом View

    var body: some View {
        Text(model.text)
    }
}

#Preview {
    ParentSharedView()
}
