//
//  Cleared.swift
//  ExpensePlanner
//
//  Created by Igor Lebedev on 23.04.2026.
//

import SwiftUI

@propertyWrapper
struct Cleared {

    private var value: String

    var wrappedValue: String {
        get { value }
        set { value = newValue.filter({ $0.isLetter }) }
    }

    init(wrappedValue: String) {
        self.value = wrappedValue.filter({ $0.isLetter })
    }
}
