//
//  StarAppsSignInView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 03/01/23.
//

import SwiftUI

struct StarAppsSignInView: View {
    var body: some View {
        ZStack {
            Image("SpaceBg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0.0) {
                LogoView()
                VStack {}.frame(height: 12.0)
                FormBox()
            }
            .padding(.horizontal, 20.0)
        }
    }
}

struct StarAppsSignInView_Previews: PreviewProvider {
    static var previews: some View {
        StarAppsSignInView()
    }
}

struct LogoView: View {
    var body: some View {
        VStack(spacing: 0.0) {
            Image(systemName: "star")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.white)
                .padding()
                .background(Color("OrangeCombo1"))
                .cornerRadius(20)
            Text("Star Apps").font(.custom("Poppins-SemiBold", size: 22))
                .foregroundColor(Color("OrangeCombo1"))
                .padding(.top, 4.0)
        }
    }
}

struct FormBox: View {
    @State private var username: String = "";
    @State private var password: String = "";
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("Username").font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(Color.black)
            HStack {
                TextField("Username...", text: $username)
            }
            .frame(height: 40)
            .padding(.horizontal, 12.0)
            .background(Color.white)
            .cornerRadius(4)
            .padding(.top, 4.0)
            
            VStack {}.frame(height: 16.0)
            
            Text("Password").font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(Color.black)
            HStack {
                SecureField("Password...", text: $password)
            }
            .frame(height: 40)
            .padding(.horizontal, 12.0)
            .background(Color.white)
            .cornerRadius(4)
            .padding(.top, 4.0)
            
            Button(action: {
                print("Button Pressed")
            }, label: {
                ZStack {
                    Text("Sign In").font(.custom("Poppins-SemiBold", size: 16))
                        .foregroundColor(Color.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color("OrangeCombo1"))
                .cornerRadius(50.0)
            })
            .padding(.top, 24.0)
            
        }
        .padding(24.0)
        .background(Color("OrangeCombo2"))
        .cornerRadius(16.0)
    }
}
