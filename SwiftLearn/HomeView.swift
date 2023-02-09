//
//  HomeView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 27/12/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchFood: String = ""
    @State private var detailPage = false;
    
    var body: some View {
        return Group {
            if detailPage {
                DetailView()
            } else {
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(alignment: .leading, spacing: 0.0) {
                        HStack {
                            Image("UserPhoto")
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text("Howdy")
                                    .font(.custom("Poppins-Regular", size: 14))
                                    .foregroundColor(Color("Lgray"))
                                Text("Luna Polar")
                                    .font(.custom("Poppins-SemiBold", size: 16))
                                    .foregroundColor(Color("Navy"))
                            }
                        }
                        .padding(.horizontal, 24.0)
                        VStack(alignment: .center) {
                            Text("What do you want\nfor lunch?")
                                .font(.custom("Poppins-Bold", size: 22))
                                .foregroundColor(Color("Navy"))
                                .multilineTextAlignment(.center)
                        }
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 66,
                            maxHeight: 66)
                        .padding(.top, 30.0)
                        HStack {
                            TextField("Search pizza, burger, kebab", text: $searchFood)
                                .padding(.leading, 24.0)
                                .disableAutocorrection(true)
                        }
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 50,
                            maxHeight: 50)
                        .background(Color("Mist"))
                        .cornerRadius(50.0)
                        .padding(.top, 24.0)
                        .padding(.horizontal, 24.0)
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Categories")
                                .font(.custom("Poppins-SemiBold", size: 16))
                                .foregroundColor(Color("Navy"))
                                .padding(.leading, 24.0)
                            ScrollView(.horizontal, showsIndicators: false,
                            content: {
                                HStack(spacing: 0.0) {
                                    HStack {}.frame(minWidth: 24.0, maxWidth: 24.0)
                                    HStack(spacing: 0.0) {
                                        Image("IconBread")
                                            .padding(.vertical, 5.0)
                                            .padding(.leading, 5.0)
                                        Text("Bread")
                                            .font(.custom("poppins-medium", size: 16))
                                            .foregroundColor(Color("Navy"))
                                            .padding(.leading, 12)
                                            .padding(.trailing, 18)
                                    }
                                    .background(Color("Mist"))
                                    .cornerRadius(50.0)
                                    .padding(.trailing, 16)
                                    HStack(spacing: 0.0) {
                                        Image("IconCarrot")
                                            .padding(.vertical, 5.0)
                                            .padding(.leading, 5.0)
                                        Text("Healthy")
                                            .font(.custom("poppins-medium", size: 16))
                                            .foregroundColor(Color("Navy"))
                                            .padding(.leading, 12)
                                            .padding(.trailing, 18)
                                    }
                                    .background(Color("Mist"))
                                    .cornerRadius(50.0)
                                    .padding(.trailing, 16)
                                    HStack(spacing: 0.0) {
                                        Image("IconDonut")
                                            .padding(.vertical, 5.0)
                                            .padding(.leading, 5.0)
                                        Text("Sweets")
                                            .font(.custom("poppins-medium", size: 16))
                                            .foregroundColor(Color("Navy"))
                                            .padding(.leading, 12)
                                            .padding(.trailing, 18)
                                    }
                                    .background(Color("Mist"))
                                    .cornerRadius(50.0)
                                    .padding(.trailing, 24.0)
                                }
                                .padding(.top, 10.0)
                            })
                        }
                        .padding(.top, 30.0)
                        VStack(alignment: .leading, spacing: 0.0) {
                            Text("Most Ordered")
                                .font(.custom("Poppins-SemiBold", size: 16))
                                .foregroundColor(Color("Navy"))
                                .padding(.leading, 24.0)
                                .padding(.bottom, 12.0)
                            HStack(alignment: .center, spacing: 0.0) {
                                Image("FoodOne")
                                VStack(alignment: .leading, spacing: 0.0) {
                                    Text("Orange Asem")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("Navy"))
                                        .padding(.bottom, 4.0)
                                    Text("Healthy")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("Lgray"))
                                }.padding(.leading, 16.0)
                                Spacer()
                                HStack(alignment: .top, spacing: 0.0) {
                                    Text("4.5")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("Navy"))
                                        .padding(.trailing, 4.0)
                                    Image("IconStar")
                                }
                            }.padding(.horizontal, 24.0).padding(.bottom, 18.0)
                                .onTapGesture {
                                    self.detailPage = true;
                                }
                            HStack(alignment: .center, spacing: 0.0) {
                                Image("FoodTwo")
                                VStack(alignment: .leading, spacing: 0.0) {
                                    Text("Gyoza Sapi")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("Navy"))
                                        .padding(.bottom, 4.0)
                                    Text("Meal")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("Lgray"))
                                }.padding(.leading, 16.0)
                                Spacer()
                                HStack(alignment: .top, spacing: 0.0) {
                                    Text("4.8")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("Navy"))
                                        .padding(.trailing, 4.0)
                                    Image("IconStar")
                                }
                            }.padding(.horizontal, 24.0).padding(.bottom, 18.0)
                                .onTapGesture {
                                    self.detailPage = true;
                                }
                            HStack(alignment: .center, spacing: 0.0) {
                                Image("FoodThree")
                                VStack(alignment: .leading, spacing: 0.0) {
                                    Text("Avocado Salad")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("Navy"))
                                        .padding(.bottom, 4.0)
                                    Text("Healthy")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("Lgray"))
                                }.padding(.leading, 16.0)
                                Spacer()
                                HStack(alignment: .top, spacing: 0.0) {
                                    Text("4.3")
                                        .font(.custom("Poppins-Medium", size: 16))
                                        .foregroundColor(Color("Navy"))
                                        .padding(.trailing, 4.0)
                                    Image("IconStar")
                                }
                            }.padding(.horizontal, 24.0).padding(.bottom, 18.0)
                                .onTapGesture {
                                    self.detailPage = true;
                                }
                        }
                        .padding(.top, 32.0)
                    }.padding(.top, 30.0)
                })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
