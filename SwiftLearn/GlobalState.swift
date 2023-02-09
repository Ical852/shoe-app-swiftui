//
//  GlobalState.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 20/01/23.
//

import Foundation

class GlobalState: ObservableObject {
    @Published var globalBikeData: [BikeModel] = []
}
