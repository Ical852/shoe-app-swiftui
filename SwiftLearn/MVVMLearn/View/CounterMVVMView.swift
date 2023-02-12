//
//  CounterMVVMView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 12/02/23.
//

import SwiftUI

struct CounterMVVMView: View {
    @ObservedObject private var counter = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 0.0) {
            Text(counter.premium ? "Premium" : "")
                .font(.largeTitle)
                .frame(height: 100)
                .foregroundColor(Color.green)
            Text("\(counter.value)")
                .font(.title)
            Button("Increment") {
                self.counter.increment()
            }
        }
        
    }
}

struct CounterMVVMView_Previews: PreviewProvider {
    static var previews: some View {
        CounterMVVMView()
    }
}
