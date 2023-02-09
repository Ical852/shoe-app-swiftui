//
//  DetailView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 02/01/23.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading, spacing: 0.0) {
                VStack(alignment: .center, spacing: 0.0) {
                    Image("DetailImg")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 30.0)
                        .padding(.horizontal, 24.0)
                }
                HStack(spacing: 0.0) {
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("Gyoza Sapi").font(.custom("Poppins-Bold", size: 22))
                            .foregroundColor(Color("Navy"))
                        Text("Meal").font(.custom("Poppins-Regular", size: 16))
                            .foregroundColor(Color("Lgray"))
                            .padding(.top, 6.0)
                    }
                    Spacer()
                    HStack(alignment: .top, spacing: 0.0) {
                        Text("4.8").font(.custom("Poppins-Medium", size: 16))
                            .foregroundColor(Color("Navy"))
                        Image("IconStar")
                            .padding(.leading, 4.0)
                    }
                }
                .padding(.top, 20.0)
                .padding(.horizontal, 24.0)
                VStack(spacing: 0.0) {
                    Text("Makanan asal Bandung dengan tekstur yang lembut sehingga ketika dimakan rasanya tidak sakit tenggorokan.").font(.custom("Poppins-Regular", size: 16))
                        .foregroundColor(Color("Navy"))
                }.padding(.horizontal, 24.0).padding(.top, 16)
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Gyoza Sapi").font(.custom("Poppins-SemiBold", size: 16))
                        .foregroundColor(Color("Navy"))
                        .padding(.leading, 24.0)
                        .padding(.bottom, 12.0)
                    HStack(spacing: 0.0) {
                        HStack {}.frame(width: 24.0)
                        Image("FoodFour")
                        Image("FoodFive")
                            .padding(.horizontal, 16.0)
                        Image("FoodSix")
                    }
                }.padding(.top, 20.0)
                VStack(spacing: 0.0) {
                    HStack(spacing: 0.0) {
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("$808.00").font(.custom("Poppins-SemiBold", size: 22))
                                .foregroundColor(Color("Navy"))
                            Text("/porsi").font(.custom("Poppins-Regular", size: 16))
                                .foregroundColor(Color("Lgray"))
                                .padding(.top, 6.0)
                        }
                        Spacer()
                        Button(action: {
                            print("Hello")
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 50)
                                    .frame(width: 190, height: 50)
                                    .foregroundColor(Color("Orange"))
                                Text("Explore Now")
                                    .font(.custom("Poppins-SemiBold", size: 16))
                                    .foregroundColor(Color("White"))
                            }
                        })
                    }
                }
                .padding(.top, 84.0)
                .padding(.horizontal, 24.0)
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
