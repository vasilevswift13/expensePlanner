//
//  Trimmed.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 23.04.2026.
//

import SwiftUI

@propertyWrapper
struct Trimmed {

    private var value: String // внутреннее хранилище

    var wrappedValue: String { // обернутое свойство \ обернутое проперти
        get { value }
        set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }

    init(wrappedValue: String) {
        self.value = wrappedValue.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
