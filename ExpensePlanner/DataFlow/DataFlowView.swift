//
//  DataFlowView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 16.04.2026.
//

import SwiftUI

final class CounterModel: ObservableObject { // ObservableObject - дает возможность отслеживать изменения в ссылочном типе
    // источник состояния для DataFlowView
    @Published var counter = 0 // @Published - изменения каких именно проперти нужно отслеживать

    func increment() {
        counter += 1
    }

    func decrement() {
        counter -= 1
    }
}

struct DataFlowView: View {
    // Объект создан в этом View
    @StateObject private var model = CounterModel() // @StateObject - источник истины ссылочного типа для родительского View

    var body: some View {
        VStack(spacing: 16) {
            Text("Counter \(model.counter)") // model.counter - @Published обертка, можно отслеживать изменения модели
            ButtonsView(model: model)
        }
    }
}

struct ButtonsView: View {
    @ObservedObject var model: CounterModel // @ObservedObject - ссылка на @StateObject, объект создан не в этом View

    var body: some View {
        HStack {
            Button("-1") {
                model.decrement()
            }
            .padding(.horizontal)
            Button("+1") {
                model.increment()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    DataFlowView()
}

// source of truth - источник истины
// @State - обертка для локального!! состояния View. Подходит для ПРОСТЫХ значений типа Int, Bool итд.
// @Binding - обертка для двусторонней ссылки на значение, владельцем которого является другой объект. Он не хранит значение, только позволяет читать и изменять его. Пара @State - @Binding
