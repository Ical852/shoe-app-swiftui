//
//  FetchGetView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 23/01/23.
//

import SwiftUI

struct FetchGetView: View {
    @ObservedObject var fetch = ApiServices()
    var body: some View {
        List {
            ForEach(fetch.post) {data in
                Button(
                    action: {
                        print("Post ke \(data.id)")
                    }, label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(data.title)
                                .font(.custom("poppins-semibold", fixedSize: 24))
                                .foregroundColor(Color.black)
                            Text(data.body)
                                .font(.custom("poppins-medium", fixedSize: 16))
                                .foregroundColor(Color.black)
                        }
                    }
                )
            }
        }
        .listStyle(PlainListStyle())
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
    }
}

struct FetchGetView_Previews: PreviewProvider {
    static var previews: some View {
        FetchGetView()
    }
}
