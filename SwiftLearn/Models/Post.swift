//
//  Post.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 23/01/23.
//

import Foundation
import SwiftUI

struct Post: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var body: String
}
