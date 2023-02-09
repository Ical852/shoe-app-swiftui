//
//  GetStartedView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 18/12/22.
//

import SwiftUI

struct GetStartedView: View {
    
    @State private var showHomePage = false;
    
    var body: some View {
        
        return Group {
            if showHomePage {
                HomeView()
            } else {
                VStack(spacing: 0.0) {
                    Image("OnboardingIllustration")
                        .padding(.bottom, 50.0)
                    HStack {
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("180K Store")
                                .font(.custom("Poppins-Regular", size: 16))
                                .foregroundColor(Color("Lgray"))
                            Text("Order Your\nFavourite Foods")
                                .font(.custom("Poppins-Bold", size: 36))
                                .foregroundColor(Color("Navy"))
                                .padding(.top, 4.0)
                            Button(action: {
                                print("Hello")
                                self.showHomePage = true;
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 50)
                                        .frame(width: 327, height: 50)
                                        .foregroundColor(Color("Orange"))
                                    Text("Explore Now")
                                        .font(.custom("Poppins-SemiBold", size: 16))
                                        .foregroundColor(Color("White"))
                                }
                            })
                            .padding(.top, 30.0)
                        }
                    }
                }
            }
        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
