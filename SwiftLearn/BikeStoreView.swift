//
//  BikeStoreView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 16/01/23.
//

import SwiftUI

struct BikeModel: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let price: String
    let location: String
    let rate: Int
    let review: String
    var carted: Bool
}

struct BikeStoreView: View {
    @State var bikeData: [BikeModel] = [
        BikeModel(image: "Bike1", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 2,500,000", location: "Kab. Bogor", rate: 4, review: "330", carted: false),
        BikeModel(image: "Bike2", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 3,500,000", location: "Kab. Jakarta", rate: 3, review: "240", carted: false),
        BikeModel(image: "Bike3", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 5,250,000", location: "Kab. Banten", rate: 5, review: "540", carted: false),
        BikeModel(image: "Bike4", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 7,800,000", location: "Kab. Tangerang", rate: 3, review: "120", carted: false),
        BikeModel(image: "Bike5", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 9,200,000", location: "Kab. Depok", rate: 5, review: "560", carted: false),
        BikeModel(image: "Bike6", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 2,500,000", location: "Kab. Bekasi", rate: 4, review: "890", carted: false),
        BikeModel(image: "Bike7", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 1,250,000", location: "Kab. Banjarmasin", rate: 4, review: "220", carted: false),
        BikeModel(image: "Bike8", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 4,500,000", location: "Kab. Manado", rate: 3, review: "130", carted: false),
        BikeModel(image: "Bike9", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 4,900,000", location: "Kab. Medan", rate: 5, review: "310", carted: false),
        BikeModel(image: "Bike10", name: "Sepeda Polygon Monarch 3.0", price: "Rp. 4,600,000", location: "Kab. Sumatra", rate: 3, review: "350", carted: false),
    ]
    @State var carted: [BikeModel] = []
    @State var favorited: [BikeModel] = []
    
    @ObservedObject var orderList = GlobalState()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                ForEach(bikeData) { data in
                    Product(onPress: {
                        if favorited.contains(where: { $0.id == data.id }) {
                            favorited = favorited.filter({ $0.id != data.id })
                        } else {
                            favorited.append(data)
                        }
                    }, onCarted: {
                        if carted.contains(where: { $0.id == data.id }) {
                            carted = carted.filter({ $0.id != data.id })
                        } else {
                            carted.append(data)
                        }
                    }, onOrder: {
                        if orderList.globalBikeData.contains(where: { $0.id == data.id }) {
                            orderList.globalBikeData = orderList.globalBikeData.filter({ $0.id != data.id })
                        } else {
                            orderList.globalBikeData.append(data)
                        }
                    }, bikeData: data,
                        favorited: favorited.contains(where: { $0.id == data.id }),
                        carted: carted.contains(where: { $0.id == data.id }),
                        ordered: orderList.globalBikeData.contains(where: { $0.id == data.id })
                    )
                    
                }
            })
            
            .navigationBarTitle("Toko Sepeda")
            .navigationBarItems(
                trailing: HStack(spacing: 5) {
                    Button(
                        action: {
                            print("press")
                        }, label: {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.gray)
                        }
                    )
                    
                    NavigationLink(destination: FavoritedView(carted: $carted, favorited: $favorited, orderList: orderList)) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color.gray)
                            Group {
                                if favorited.count > 0 {
                                    Text(String(favorited.count))
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 10, y: -10)
                                }
                            }
                        }
                    }
                    
                    NavigationLink(destination: CartView(carted: $carted, favorited: $favorited, orderList: orderList)) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "cart.fill")
                                .foregroundColor(Color.gray)
                            Group {
                                if carted.count > 0 {
                                    Text(String(carted.count))
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 10, y: -10)
                                }
                            }
                        }
                    }
                    
                    NavigationLink(destination: OrderListView(orderList: orderList, favorited: $favorited, carted: $carted)) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "suitcase.cart.fill")
                                .foregroundColor(Color.gray)
                            Group {
                                if orderList.globalBikeData.count > 0 {
                                    Text(String(orderList.globalBikeData.count))
                                        .foregroundColor(Color.white)
                                        .padding(5)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 10, y: -10)
                                }
                            }
                        }
                    }
                }
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BikeStoreView_Previews: PreviewProvider {
    static var previews: some View {
        BikeStoreView()
    }
}

struct Product: View {
    var onPress: () -> Void
    var onCarted: () -> Void
    var onOrder: () -> Void
    var bikeData: BikeModel
    var favorited: Bool = false
    var carted: Bool = false
    var ordered: Bool = false
    var cartType: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            ZStack(alignment: .topTrailing) {
                Image(bikeData.image)
                    .resizable()
                    .scaledToFill()
                    .background(Color.gray)
                    .frame(height: 200)
                    .clipped()
                Button(
                    action: {
                        onPress()
                    }, label: {
                        Image(systemName: favorited ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.red)
                            .padding()
                    }
                )
            }
            
            VStack(alignment: .leading, spacing: 0.0) {
                Text(bikeData.name)
                    .font(.custom("poppins-semibold", fixedSize: 26))
                
                Text(bikeData.price)
                    .font(.custom("poppins-semibold", fixedSize: 26))
                    .foregroundColor(Color.red)
                
                HStack(spacing: 0.0) {
                    Image(systemName: "location.circle")
                    Text(bikeData.location)
                        .font(.custom("poppins-medium", fixedSize: 15))
                        .padding(.leading, 6.0)
                }
                .padding(.top, 12.0)
                
                HStack(alignment: .center, spacing: 0.0) {
                    StarGenerator(stars: bikeData.rate)
                    Text(bikeData.review)
                        .font(.custom("poppins-medium", fixedSize: 16))
                        .padding(.leading, 4)
                }
                .padding(.top, 10.0)
                
                Button(
                    action: {
                        onCarted()
                    }, label: {
                        HStack(spacing: 0.0) {
                            Spacer()
                            Image(systemName: cartType ? "cart.fill.badge.minus" : "cart")
                                .foregroundColor(Color.white)
                            Text(cartType ? "Hapus dari Keranjang" : carted ? "Ditambahkan ke Keranjang" : "Tambahkan ke Keranjang")
                                .font(.custom("poppins-regular", fixedSize: 16))
                                .foregroundColor(Color.white)
                                .padding(.leading, 16)
                            Spacer()
                        }
                        .frame(height: 50)
                        .background(cartType ? Color.red : carted ? Color.cyan : Color.green)
                    }
                )
                .cornerRadius(10)
                .padding(.top, 32)
                
                Button(
                    action: {
                        onOrder()
                    }, label: {
                        HStack(spacing: 0.0) {
                            Spacer()
                            Image(systemName: "suitcase.cart.fill")
                                .foregroundColor(Color.white)
                            Text(ordered ? "Hapus Dari Order List" : "Beli Sekarang")
                                .font(.custom("poppins-regular", fixedSize: 16))
                                .foregroundColor(Color.white)
                                .padding(.leading, 16)
                            Spacer()
                        }
                        .frame(height: 50)
                        .background(ordered ? Color.orange : Color.yellow)
                    }
                )
                .cornerRadius(10)
                .padding(.top, 16)
            }
            .padding(.all, 12.0)
            
        }
        .background(Color("Mist"))
        .cornerRadius(16)
        .padding(.horizontal, 16.0)
        .padding(.bottom, 20)
    }
}

struct StarGenerator: View {
    var stars: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1..<stars+1, id: \.self) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(Color.yellow)
            }
        }
    }
}

struct CartView: View {
    @Binding var carted: [BikeModel]
    @Binding var favorited: [BikeModel]
    @ObservedObject var orderList: GlobalState
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false, content: {
                ForEach(carted) { data in
                    Product(
                        onPress: {
                            if favorited.contains(where: { $0.id == data.id }) {
                                favorited = favorited.filter({ $0.id != data.id })
                            } else {
                                favorited.append(data)
                            }
                        },
                        onCarted: {
                            carted = carted.filter({ $0.id != data.id })
                        }, onOrder: {
                            if orderList.globalBikeData.contains(where: { $0.id == data.id }) {
                                orderList.globalBikeData = orderList.globalBikeData.filter({ $0.id != data.id })
                            } else {
                                orderList.globalBikeData.append(data)
                            }
                        }, bikeData: data,
                            favorited: favorited.contains(where: { $0.id == data.id }),
                            carted: carted.contains(where: { $0.id == data.id }),
                            ordered: orderList.globalBikeData.contains(where: { $0.id == data.id })
                            ,cartType: true
                        )
                }
            })
        }
        .navigationBarTitle("Your Carts")
    }
}

struct FavoritedView: View {
    @Binding var carted: [BikeModel]
    @Binding var favorited: [BikeModel]
    @ObservedObject var orderList: GlobalState
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false, content: {
                ForEach(favorited) { data in
                    Product(
                        onPress: {
                            favorited = favorited.filter({ $0.id != data.id })
                        },
                        onCarted: {
                            if carted.contains(where: { $0.id == data.id }) {
                                carted = carted.filter({ $0.id != data.id })
                            } else {
                                carted.append(data)
                            }
                        }, onOrder: {
                            if orderList.globalBikeData.contains(where: { $0.id == data.id }) {
                                orderList.globalBikeData = orderList.globalBikeData.filter({ $0.id != data.id })
                            } else {
                                orderList.globalBikeData.append(data)
                            }
                        },
                        bikeData: data,
                        favorited: favorited.contains(where: { $0.id == data.id }),
                        carted: carted.contains(where: { $0.id == data.id }),
                        ordered: orderList.globalBikeData.contains(where: { $0.id == data.id })
                    )
                }
            })
        }
        .navigationBarTitle("Your Favorited")
    }
}

struct OrderListView: View {
    @ObservedObject var orderList: GlobalState
    @Binding var favorited: [BikeModel]
    @Binding var carted: [BikeModel]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false, content: {
                ForEach(orderList.globalBikeData) { data in
                    Product(
                        onPress: {
                            if favorited.contains(where: { $0.id == data.id }) {
                                favorited = favorited.filter({ $0.id != data.id })
                            } else {
                                favorited.append(data)
                            }
                        },
                        onCarted: {
                            if carted.contains(where: { $0.id == data.id }) {
                                carted = carted.filter({ $0.id != data.id })
                            } else {
                                carted.append(data)
                            }
                        }, onOrder: {
                            orderList.globalBikeData = orderList.globalBikeData.filter({ $0.id != data.id })
                        },
                        bikeData: data,
                        favorited: favorited.contains(where: { $0.id == data.id }),
                        carted: carted.contains(where: { $0.id == data.id }),
                        ordered: orderList.globalBikeData.contains(where: { $0.id == data.id })
                    )
                }
            })
        }
        .navigationBarTitle("Your Order List")
    }
}
