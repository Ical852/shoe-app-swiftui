//
//  DrawShapeView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 23/01/23.
//

import SwiftUI

struct DrawShapeView: View {
    var body: some View {
        VStack {
//            Circle()
//                .overlay(
//                    Circle()
//                        .stroke(Color.green, lineWidth: 5)
//                )
//                .foregroundColor(Color.blue)
            
//            Rectangle()
//                .overlay(
//                    Rectangle()
//                        .stroke(Color.green, lineWidth: 5)
//                )
//                .foregroundColor(Color.blue)
//                .padding()
            
//            Capsule()
//                .overlay(
//                    Capsule()
//                        .stroke(Color.green, lineWidth: 5)
//                )
//                .foregroundColor(Color.blue)
//                .padding()
            
//            Ellipse()
//                .overlay(
//                    Ellipse()
//                        .stroke(Color.green, lineWidth: 5)
//                )
//                .foregroundColor(Color.blue)
//                .padding()
            
//            RoundedRectangle(cornerRadius: 30, style: .circular)
//                .size(width: 300, height: 400)
//                .scale(0.5, anchor: .topLeading)
//                .offset(x: 50, y: 50)
//                .rotation(Angle(degrees: 30))
//                .trim(from: 0.1, to: 0.8)
//                .padding()
            
            Image("Bike1")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 100)
                .clipped()
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.green))
        }
    }
}

struct DrawShapeView_Previews: PreviewProvider {
    static var previews: some View {
        DrawShapeView()
    }
}
