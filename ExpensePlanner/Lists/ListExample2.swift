//
//  ListExample2.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 7.04.26.
//

import SwiftUI

/// Структура 1

struct Role: Identifiable { // структура роли = модель данных (MODEL)
    let id = UUID()
    let title: String
    let face: String
}

/// Структура 2

struct ListExample2: View { // корневой VIEW = ранее Example2TableViewController

    var roles = [ // все роли пьесы
        Role(title: "Гамлет", face: "person.circle.fill"), // содержимое роли = сами данные (MODEL)
        Role(title: "Офелия", face: "person.fill"),
        Role(title: "Лир", face: "person.fill.checkmark.rtl"),
        Role(title: "Йорик", face: "person.slash")
    ]

    var body: some View {
        List(roles) { role in // Сцена = Таблица = UITableView
            Human(role: role) // каждому актеру раздали по роли
        }
    }
}

/// Структура 3

struct Human: View { // HumanTableViewCell
    let role: Role // переданная человеку роль

    // конструктора init нет, но подразумевается, что он существует по умолчанию

    var body: some View { // что делать с полученной ролью
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: role.face)
                .font(.system(size: 24))
            Text(role.title)
                .padding(.horizontal)
        }
    }
}

#Preview {
    ListExample2()
}

