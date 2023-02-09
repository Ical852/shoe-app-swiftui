//
//  FormNavView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 04/01/23.
//

import SwiftUI

struct FormNavView: View {
    var body: some View {
        NavigationView{
            
            Form {
                Section(
                    header: VStack(alignment: .leading, spacing: 0.0) {
                        NavigationLink(destination: About()) {
                            HStack(alignment: .center, spacing: 0.0) {
                                Image("Ava")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                VStack(alignment: .leading, spacing: 0.0){
                                    Text("Shalahuddin Ahmad Aziz")
                                        .font(.custom("poppins-semibold", size: 16))
                                        .foregroundColor(Color.black)
                                    Text("Mobile Developer")
                                        .font(.custom("poppins-regular", size: 14))
                                        .foregroundColor(Color.black)
                                }
                                .padding(.leading, 8.0)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(Color.gray)
                            }
                            .padding(16.0)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .background(Color.white)
                        }
                    }
                ) {}.textCase(nil).padding(.top, -16)
                
                Section(
                    header: VStack(alignment: .leading, spacing: 0.0) {
                        Text("Pengaturan Umum").font(.custom("Poppins-Medium", fixedSize: 14)).foregroundColor(Color.gray)
                            .padding(.leading, 16)
                            .padding(.bottom, 10.0)
                        
                        NavigationLink(destination: StarMessage()) {
                            HStack(alignment: .center, spacing: 0.0) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color.orange)
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.white)
                                        .frame(width: 22, height: 22)
                                }
                                Text("Pesan Berbintang")
                                    .font(.custom("poppins-regular", size: 16))
                                    .foregroundColor(Color.black)
                                .padding(.leading, 20.0)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.horizontal, 16.0)
                            .padding(.vertical, 6.0)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .background(Color.white)
                        }
                        
                        NavigationLink(destination: Web()) {
                            HStack(alignment: .center, spacing: 0.0) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color.green)
                                    Image(systemName: "tv")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.white)
                                        .frame(width: 22, height: 22)
                                }
                                Text("WhatsApp Web/Desktop")
                                    .font(.custom("poppins-regular", size: 16))
                                    .foregroundColor(Color.black)
                                .padding(.leading, 20.0)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.horizontal, 16.0)
                            .padding(.vertical, 6.0)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .background(Color.white)
                            .padding(.top, 2.0)
                        }
                    }
                ) {}.textCase(nil).padding(.top, -16)
                
                Section(
                    header: VStack(alignment: .leading, spacing: 0.0) {
                        Text("Pengaturan Akun").font(.custom("Poppins-Medium", fixedSize: 14)).foregroundColor(Color.gray)
                            .padding(.leading, 16)
                            .padding(.bottom, 10.0)
                        
                        NavigationLink(destination: Account()) {
                            HStack(alignment: .center, spacing: 0.0) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color.blue)
                                    Image(systemName: "person")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.white)
                                        .frame(width: 18, height: 18)
                                }
                                Text("Akun")
                                    .font(.custom("poppins-regular", size: 16))
                                    .foregroundColor(Color.black)
                                .padding(.leading, 20.0)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.horizontal, 16.0)
                            .padding(.vertical, 6.0)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .background(Color.white)
                        }
                        
                        NavigationLink(destination: Message()) {
                            HStack(alignment: .center, spacing: 0.0) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color.green)
                                    Image(systemName: "phone.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.white)
                                        .frame(width: 22, height: 22)
                                }
                                Text("Chat")
                                    .font(.custom("poppins-regular", size: 16))
                                    .foregroundColor(Color.black)
                                .padding(.leading, 20.0)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(Color.gray)
                            }
                            .padding(.horizontal, 16.0)
                            .padding(.vertical, 6.0)
                            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                            .background(Color.white)
                            .padding(.top, 2.0)
                        }
                        
                    }
                ) {}.textCase(nil).padding(.top, -16)
            }
            .navigationBarTitle("Setting")
            
        }
    }
}

struct FormNavView_Previews: PreviewProvider {
    static var previews: some View {
        FormNavView()
    }
}

struct About : View {
    var body: some View {
        Text("Halaman About")
    }
}

struct StarMessage : View {
    var body: some View {
        Text("Halaman Star Message")
    }
}

struct Web : View {
    var body: some View {
        Text("Halaman Web Dekstop")
    }
}

struct Account : View {
    var body: some View {
        Text("Halaman Akun")
    }
}

struct Message : View {
    var body: some View {
        Text("Halaman Chat")
    }
}
