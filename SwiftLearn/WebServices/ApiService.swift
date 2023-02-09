//
//  ApiService.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 23/01/23.
//

import Foundation
import SwiftUI

class ApiServices: ObservableObject {
    @Published var post = [Post]()
    
    init() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let postData = data {
                    let decodedData = try JSONDecoder().decode([Post].self, from: postData)
                    DispatchQueue.main.async {
                        self.post = decodedData
                    }
                } else {
                    print("no data")
                }
            } catch {
                print("error")
            }
        }
        .resume()
    }
}
