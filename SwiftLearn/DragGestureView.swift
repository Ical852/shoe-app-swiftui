//
//  DragGestureView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 23/01/23.
//

import SwiftUI

struct DragGestureView: View {
    @State private var showMenu = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        let drag = DragGesture()
            .onChanged {
                gesture in
                self.offset = gesture.translation
            }
            .onEnded {
                value in
                self.offset = CGSize.zero
                self.showMenu = false
            }
        
        return ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Bike1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipped()
                
                Button(
                    action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }, label: {
                        Text("Promo Merdeka")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    }
                )
            }
            
            if showMenu {
                Kupon()
                    .transition(.move(edge: .bottom)).animation(.default)
                    .offset(y: self.offset.height)
                    .gesture(drag)
            }
        }
    }
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}

struct Kupon: View {
    var body: some View {
        VStack {
            Text("Selamat anda mendapatkan kupon merdeka sebanyak 500 point")
                .font(.custom("poppins-bold", fixedSize: 24))
                .foregroundColor(Color.white)
        }
        .frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.red)
        .cornerRadius(20)
        .edgesIgnoringSafeArea(.bottom)
    }
}
