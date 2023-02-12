//
//  ShoeService.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 31/01/23.
//

import Foundation
import SwiftUI

class ShoesService: ObservableObject {
    @Published var bestSeller: ShoesResponse?
    @Published var popular: ShoesResponse?
    @Published var newArrivals: ShoesResponse?
    @Published var bsLoading: Bool = false
    @Published var popLoading: Bool = false
    @Published var naLoading: Bool = false
    
    @Published var webReady: Bool = false
    @Published var transaction: TransactionResponse?
    
    init() {
        self.bsLoading = true
        self.popLoading = true
        
        guard let url = URL(string: "http://192.168.100.17:8000/api/products/cat/1") else {
            print("ERROR ANJING")
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("ERROR ANJING")
                return
            }
            
            let result = try? JSONDecoder().decode(ShoesResponse.self, from: data)

            if let result = result {
                self.bsLoading = false
                DispatchQueue.main.async {
                    self.bestSeller = result
                }
            }
        }.resume()
        
        guard let url2 = URL(string: "http://192.168.100.17:8000/api/products/cat/2") else {
            print("ERROR ANJING")
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url2) { data, response, error in
            guard let data = data, error == nil else {
                print("ERROR ANJING")
                return
            }
            
            let result = try? JSONDecoder().decode(ShoesResponse.self, from: data)

            if let result = result {
                self.popLoading = false
                DispatchQueue.main.async {
                    self.popular = result
                }
            }
        }.resume()
        
        getAll()
    }
    
    func getAll() {
        self.naLoading = true
        
        guard let url3 = URL(string: "http://192.168.100.17:8000/api/products") else {
            print("ERROR ANJING")
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url3) { data, response, error in
            guard let data = data, error == nil else {
                print("ERROR ANJING")
                return
            }
            
            let result = try? JSONDecoder().decode(ShoesResponse.self, from: data)

            if let result = result {
                self.naLoading = false
                DispatchQueue.main.async {
                    self.newArrivals = result
                }
            }
        }.resume()
    }
    
    func getByCategoryId(id: Int) {
        if (id == 0) {
            return getAll()
        } else {
            self.naLoading = true
            guard let url = URL(string: "http://192.168.100.17:8000/api/products/cat/" + String(id)) else {
                print("ERROR ANJING")
                fatalError("INVALID URL")
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("ERROR ANJING")
                    return
                }
                
                let result = try? JSONDecoder().decode(ShoesResponse.self, from: data)

                if let result = result {
                    self.naLoading = false
                    DispatchQueue.main.async {
                        self.newArrivals = result
                    }
                }
            }.resume()
        }
    }
    
    func createTransaction(request: TransactionRequest) {
        guard let url = URL(string: "http://192.168.100.17:8000/api/transaction") else {
            print("ERROR ANJING")
            return
        }
        
        guard let findalBody = try? JSONEncoder().encode(request) else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content_Type")
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = findalBody
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("ERROR ANJING")
                return
            }
            
            let result = try? JSONDecoder().decode(TransactionResponse.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    self.transaction = result
                    self.webReady = true
                }
            }
        }.resume()
    }
    
    func closeWebview() {
        self.webReady = false
    }
}
