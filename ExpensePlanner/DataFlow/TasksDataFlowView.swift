//
//  TasksDataFlowView.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 16.04.2026.
//

import SwiftUI

struct ExampleTask: Identifiable { // Model
    let id = UUID()
    var title: String
    var price: String
    var isDone: Bool
}

final class TasksDataFlowViewModel: ObservableObject { // ViewModel
    @Published var tasks: [ExampleTask] = [
        ExampleTask(title: "Buy milk", price: "10", isDone: false),
        ExampleTask(title: "Buy eggs", price: "10", isDone: false),
        ExampleTask(title: "Buy bread", price: "10", isDone: false),
        ExampleTask(title: "Buy milk", price: "10", isDone: false)
        ]

    var sortedTasks: [ExampleTask] {
        get { tasks.sorted { !$0.isDone && $1.isDone } }
        set { tasks = newValue.sorted { !$0.isDone && $1.isDone } }
    }
}

struct TasksDataFlowView: View { // View

    @StateObject private var viewModel = TasksDataFlowViewModel()

    var body: some View {
        List {
            ForEach($viewModel.sortedTasks) { $task in
                TaskView(task: $task)
            }
        }
    }
}

struct TaskView: View {
    @Binding var task: ExampleTask

    var body: some View {
        HStack {
            Button {
                task.isDone.toggle()
            } label: {
                task.isDone ?
                Image(systemName: "circle.badge.checkmark.fill") :
                Image(systemName: "circle.badge.checkmark")
            }
            .padding(.trailing)
            TextField("Enter task", text: $task.title)
                .padding(.trailing)
            Spacer()
            TextField("Enter price", text: $task.price)
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    TasksDataFlowView()
}
