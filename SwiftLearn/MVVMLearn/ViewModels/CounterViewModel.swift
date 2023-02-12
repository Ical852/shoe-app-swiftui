//
//  CounterViewModel.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 12/02/23.
//

import Foundation
import SwiftUI

class CounterViewModel: ObservableObject {
    @Published private var counter: Counter = Counter()
    
    func increment() {
        counter.increment()
    }
    
    var value: Int {
        counter.value
    }
    
    var premium: Bool {
        counter.isPremium
    }
}
