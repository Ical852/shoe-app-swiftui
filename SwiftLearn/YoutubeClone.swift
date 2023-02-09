//
//  YoutubeClone.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 11/01/23.
//

import SwiftUI

struct YoutubeClone: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Beranda")
                }
            
            Home()
                .tabItem {
                    Image(systemName: "paperplane.fill")
                    Text("Beranda")
                }
            
            Home()
                .tabItem {
                    Image(systemName: "tray.fill")
                    Text("Beranda")
                }
            
            Home()
                .tabItem {
                    Image(systemName: "envelope.fill")
                    Text("Beranda")
                }
            
            Home()
                .tabItem {
                    Image(systemName: "play.rectangle.fill")
                    Text("Beranda")
                }
        }
        .accentColor(.red)
    }
}

struct YoutubeClone_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeClone()
    }
}

struct Home: View {
    var body: some View {
        NavigationView {
            Content()
            
                .navigationBarItems(
                    leading: HStack {
                        Button(
                            action: {
                                print("pressed")
                            }, label: {
                                Image("youtube")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 20)
                            }
                        )
                    },
                    trailing: HStack(alignment: .center, spacing: 15.0) {
                        Button(
                            action: {
                                print("pressed")
                            }, label: {
                                Image(systemName: "tray.full")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.gray)
                            }
                        )
                        Button(
                            action: {
                                print("pressed")
                            }, label: {
                                Image(systemName: "video.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.gray)
                            }
                        )
                        Button(
                            action: {
                                print("pressed")
                            }, label: {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color.gray)
                            }
                        )
                        Button(
                            action: {
                                print("pressed")
                            }, label: {
                                Image("Ava")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.gray)
                            }
                        )
                    }
                )
        }
    }
}

struct YoutubeModel: Identifiable {
    let id = UUID()
    let avatar: String
    let imageName: String
    let title: String
    let desc: String
    let time: String
}

struct Content: View {
    let youtubeData: [YoutubeModel] = [
        YoutubeModel(avatar: "Ava", imageName: "Youtube1", title: "2021 SwiftUI Tutorial for Beginner", desc: "Kocal Programming - 50jt x ditonton - 9 jam yang lalu", time: "3.20.07"),
        YoutubeModel(avatar: "Ava", imageName: "Youtube2", title: "SwiftUI Basics Tutorial", desc: "Kocal Programming - 150jt x ditonton - 1 minggu yang lalu", time: "1.19.31"),
        YoutubeModel(avatar: "Ava", imageName: "Youtube3", title: "My Honest Opinion about UIKit vs SwiftUI in 2023", desc: "Kocal Programming - 10m x ditonton - 1 tahun yang lalu", time: "0.50")
    ]
    
    var body: some View {
        List {
            ForEach(youtubeData) {data in
                YoutubeItem(youtubeData: data)
            }
        }
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .listStyle(PlainListStyle())
    }
}

struct YoutubeItem: View {
    let youtubeData: YoutubeModel
    
    var body: some View {
        VStack(spacing: 0.0) {
            ZStack(alignment: .bottomTrailing) {
                Image(youtubeData.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                Text(youtubeData.time)
                    .font(.custom("poppuns-medium", fixedSize: 14))
                    .foregroundColor(Color.white)
                    .padding(.all, 5)
                    .background(Color.black)
                    .cornerRadius(5)
                    .padding(.trailing, 5)
                    .padding(.bottom, 5)
            }
            
            HStack(spacing: 0.0) {
                Image(youtubeData.avatar)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(youtubeData.title)
                        .scaledToFit()
                        .font(.custom("poppins-semibold", fixedSize: 18))
                    Text(youtubeData.desc)
                        .foregroundColor(Color.black)
                        .font(.custom("poppins-regular", fixedSize: 12))
                }
                .padding(.leading, 16.0)
                
                Spacer()
                
                Image(systemName: "list.bullet")
                    .padding(.leading, 24.0)
            }
            .padding(.top, 12.0)
        }
    }
}
