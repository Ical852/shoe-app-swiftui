//
//  GeometryReaderView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 22/01/23.
//

import SwiftUI

struct PictureModel: Identifiable {
    let id = UUID()
    var picture: String
}

struct GalleryModel: Identifiable {
    let id = UUID()
    var pictures: [PictureModel]
}

struct GeometryReaderView: View {
    @State var pictures: [GalleryModel] = [
        GalleryModel(pictures: [PictureModel(picture: "Bike1"), PictureModel(picture: "Bike2")]),
        GalleryModel(pictures: [PictureModel(picture: "Bike3"), PictureModel(picture: "Bike4")]),
        GalleryModel(pictures: [PictureModel(picture: "Bike5"), PictureModel(picture: "Bike6")]),
        GalleryModel(pictures: [PictureModel(picture: "Bike7"), PictureModel(picture: "Bike8")]),
        GalleryModel(pictures: [PictureModel(picture: "Bike9"), PictureModel(picture: "Bike10")]),
    ]
    
    @State var pictures2: [GalleryModel] = [
        GalleryModel(pictures: [PictureModel(picture: "Bike1"), PictureModel(picture: "Bike2"), PictureModel(picture: "Bike3")]),
        GalleryModel(pictures: [PictureModel(picture: "Bike4"), PictureModel(picture: "Bike5"), PictureModel(picture: "Bike6")]),
        GalleryModel(pictures: [PictureModel(picture: "Bike7"), PictureModel(picture: "Bike8"), PictureModel(picture: "Bike9")]),
    ]
    
    var body: some View {
        GeometryReader {
            geo in
            ScrollView(showsIndicators: false, content: {
                VStack(alignment: .center, spacing: 0.0) {
//                    Text("2 Grid")
//                        .font(.custom("poppins-semibold", fixedSize: 24))
//                        .foregroundColor(Color.black)
//                    ForEach(pictures) { data in
//                        HStack(spacing: 0.0) {
//                            Spacer()
//                            Group {
//                                ForEach(data.pictures) {pic in
//                                    Image(pic.picture)
//                                        .resizable()
//                                        .scaledToFill()
//                                        .frame(width: geo.size.width / 2, height: 200)
//                                        .clipped()
//                                }
//                            }
//                            Spacer()
//                        }
//                        .padding(.bottom, 12.0)
//                    }
                    
                    Text("3 Grid")
                        .font(.custom("poppins-semibold", fixedSize: 24))
                        .foregroundColor(Color.black)
                    ForEach(pictures2) { data in
                        HStack(spacing: 4) {
                            Spacer()
                            Group {
                                ForEach(data.pictures) {pic in
                                    Image(pic.picture)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geo.size.width / 3 - 12, height: 200)
                                        .clipped()
                                }
                            }
                            Spacer()
                        }
                        .padding(.bottom, 12.0)
                    }
                }
            })

        }
        
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
