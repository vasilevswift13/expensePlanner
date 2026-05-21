//
//  Capitalized.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 23.04.2026.
//

import SwiftUI

@propertyWrapper
struct Capitalized {

    private var value: String // внутреннее хранилище

    var wrappedValue: String { // обернутое свойство \ обернутое проперти
        get { value }
        set { value = newValue.capitalized }
    }

    var projectedValue: String { // доступ через $
        return "Длина строки \(value.count)"
    }

    init(wrappedValue: String) {
        self.value = wrappedValue.capitalized
    }
}
