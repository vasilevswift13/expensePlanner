//
//  Uppercased.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 23.04.2026.
//

import SwiftUI

@propertyWrapper
struct Uppercased {
                // SOME TEXT
    private var value: String // внутреннее хранилище

    var wrappedValue: String { // обернутое свойство \ обернутое проперти
        get { value }

        // new text
        set { value = newValue.uppercased() }
    }
                       // some text
    init(wrappedValue: String) {
        self.value = wrappedValue.uppercased()
    }
}
