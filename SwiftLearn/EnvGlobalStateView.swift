//
//  EnvGlobalStateView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 21/01/23.
//

import SwiftUI

struct EnvGlobalStateView: View {
    @EnvironmentObject var authUser: AuthUser
    
    var body: some View {
        if (!authUser.isLoggedIn) {
            return AnyView(Login())
        } else {
            return AnyView(HomeLogged())
        }
    }
}

struct HomeLogged: View {
    @EnvironmentObject var authUser: AuthUser
    
    var body: some View {
        NavigationView {
            Text("Home")
            
                .navigationBarTitle("Home")
                .navigationBarItems(trailing: HStack{
                    Button(
                        action: {
                            authUser.isLoggedIn = false
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.right.circle")
                        }
                    )
                })
        }
    }
}

struct Login: View {
    @EnvironmentObject var authUser: AuthUser
    @State var nullcheck: Bool = false
    
    @State var username: String = ""
    @State var password: String = ""
    
    func loginCheck() {
        if(username == "" && password == "") {
            nullcheck = true
            authUser.isCorrect = true
        } else {
            nullcheck = false
            if(username == "Admin" && password == "123") {
                authUser.isLoggedIn = true
                authUser.isCorrect = true
            } else {
                authUser.isLoggedIn = false
                authUser.isCorrect = false
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0.0) {
                        Text("Hi!")
                            .font(.custom("poppins-semibold", fixedSize: 28))
                            .foregroundColor(Color.white)
                        Text("Welcome Back")
                            .font(.custom("poppins-regular", fixedSize: 20))
                            .foregroundColor(Color.white)
                            .padding(.top, -5)
                    }
                    
                    Spacer()
                    
                    Image("Login")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipped()
                }
                .frame(height: 200)
                .padding(.horizontal, 24)
                .background(Color.purple)
                .clipShape(CustomShape(corner: .bottomRight, radius: 50))
                .edgesIgnoringSafeArea(.top)
                
                
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Username / email address")
                        .font(.custom("poppins-regular", fixedSize: 16))
                    HStack {
                        TextField("Username...", text: $username)
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 16)
                    .background(Color("Mist"))
                    .cornerRadius(8)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    
                    Text("Password")
                        .font(.custom("poppins-regular", fixedSize: 16))
                    HStack {
                        SecureField("Password...", text: $password)
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 16)
                    .background(Color("Mist"))
                    .cornerRadius(8)
                    .padding(.top, 6)
                    
                    if(!authUser.isCorrect) {
                        Text("Username dan password salah!")
                            .font(.custom("poppins-regular", fixedSize: 16))
                            .foregroundColor(Color.red)
                            .padding(.top, 12)
                    }
                    
                    if(nullcheck) {
                        Text("Masukkan username dan password terlebih dahulu")
                            .font(.custom("poppins-regular", fixedSize: 16))
                            .foregroundColor(Color.red)
                            .padding(.top, 12)
                    }
                    
                    Button(
                        action: {
                            
                        }, label: {
                            Text("Forgot Password?")
                                .font(.custom("poppins-medium", fixedSize: 16))
                        }
                    )
                    .padding(.top, 12)
                    
                    Button(
                        action: {
                            loginCheck()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .frame(height: 50)
                                    .foregroundColor(Color.purple)
                                
                                Text("Sign In")
                                    .font(.custom("poppins-medium", fixedSize: 16))
                                    .foregroundColor(Color.white)
                            }
                        }
                    )
                    .padding(.top, 12)
                    
                    HStack() {
                        Spacer()
                        
                        Button(
                            action: {
                                
                            }, label: {
                                Text("Our Privacy Policy")
                                    .font(.custom("poppins-medium", fixedSize: 16))
                                    .foregroundColor(Color.purple)
                            }
                        )
                        
                        Spacer()
                    }
                    .padding(.top, 16)
                    
                    HStack {
                        Text("Don't have an account?")
                            .font(.custom("poppins-semibold", fixedSize: 16))
                            .foregroundColor(Color.black)
                        
                        Spacer()
                        
                        Button(
                            action: {
                                
                            }, label: {
                                Text("Sign Up?")
                                    .font(.custom("poppins-medium", fixedSize: 16))
                                    .foregroundColor(Color.purple)
                            }
                        )
                    }
                    .padding(.top, 32)
                    
                }
                .padding(.horizontal, 24)
                
                Spacer()
            }
        }
    }
}

struct CustomShape: Shape {
    var corner: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

struct EnvGlobalStateView_Previews: PreviewProvider {
    static var previews: some View {
        EnvGlobalStateView().environmentObject(AuthUser())
    }
}
