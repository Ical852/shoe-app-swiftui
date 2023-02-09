//
//  CovidDataView.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 31/01/23.
//

import SwiftUI

struct ShoesDataView: View {
    @ObservedObject var fetch = ShoesService()
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0.0) {
                ScrollView(showsIndicators: false, content: {
                    HeadContent()
                    
                    BestSellerSection(shoes: fetch.bestSeller?.data ?? [], loading: fetch.bsLoading)
                    
                    SuperRareSection()
                    
                    PopularSection(shoes: fetch.popular?.data ?? [], loading: fetch.popLoading)
                    
                    CategorySection(fetch: fetch)
                    
                    NewArivalSection(shoes: fetch.newArrivals?.data ?? [], loading: fetch.naLoading)
                    
                    VStack {}.frame(height: 100)
                })
                
                Spacer()
                
                BottomMenu()
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct HeadContent: View {
    var body: some View {
        ZStack(alignment: .top) {
            HStack {}
                .frame(width: UIScreen.main.bounds.width, height: 214)
                .background(Color("NewOrange"))
                .clipShape(CustomShape(corner: .bottomLeft, radius: 12))
                .clipShape(CustomShape(corner: .bottomRight, radius: 12))
            
            VStack(spacing: 0.0) {
                ProfileSection()
                
                SearchSection()
                
                TopUpSection()
            }
        }
    }
}

struct ProfileSection: View {
    var body: some View {
        HStack {
            Text("Hello,\nShalahuddin")
                .foregroundColor(Color.white)
                .font(.custom("poppins-semibold", fixedSize: 24))
            
            Spacer()
            
            HStack {
                Image("Ava")
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            }
            .frame(width: 60, height: 60)
            .background(Color.white)
            .cornerRadius(50)
            
        }
        .padding(.top, 44)
        .padding(.horizontal, 24)
    }
}

struct SearchSection: View {
    var body: some View {
        HStack(spacing: 0.0) {
            Image("IconSearch")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .clipped()
                .padding(.leading, 12)
            Text("Search your shoes here...")
                .foregroundColor(Color.gray)
                .font(.custom("poppins-regular", fixedSize: 14))
                .padding(.leading, 12)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 48, height: 40)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color("Lgray"), radius: 2, x: 1, y: 1)
        .padding(.top, 16)
    }
}

struct TopUpSection: View {
    var body: some View {
        HStack(spacing: 0.0) {
            Image("IconQr")
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
                .clipped()
                .padding(.leading, 18)
            
            HStack {}
                .frame(width: 1, height: 34)
                .background(Color.gray)
                .padding(.horizontal, 18)
            
            VStack(alignment: .leading, spacing: 0.0) {
                Text("IDR 50.000")
                    .foregroundColor(Color("NewOrange"))
                    .font(.custom("poppins-semibold", fixedSize: 14))
                Text("Your SsmPay Right Now")
                    .foregroundColor(Color.gray)
                    .font(.custom("poppins-regular", fixedSize: 10))
            }
            
            Spacer()
            
            HStack {
                Image("IconPlus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height: 12)
                    .clipped()
            }
            .frame(width: 24, height: 24)
            .background(Color("Orange2"))
            .cornerRadius(4)
            .padding(.trailing, 18)
        }
        .frame(width: UIScreen.main.bounds.width - 48, height: 60)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("Lgray"), radius: 2, x: 1, y: 1)
        .padding(.top, 12)
    }
}

struct BestSellerSection: View {
    var shoes: [Products]
    var loading: Bool
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Best Seller Shoes")
                        .foregroundColor(Color.black)
                        .font(.custom("poppins-semibold", fixedSize: 14))
                    Text("Get best seller shoes right now !")
                        .foregroundColor(Color.gray)
                        .font(.custom("poppins-regular", fixedSize: 12))
                        .padding(.top, 2)
                }
                
                Spacer()
            }
            .padding(.leading, 24)
            
            ZStack {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 0.0) {
                        HStack {}.frame(width: 24)
                        ForEach(shoes) { shoe in
                            BestSellerItem(product: shoe)
                        }
                    }
                })
                
                if (loading) {
                    VStack {
                        Indicator()
                        Text("Getting Data...")
                            .font(.custom("poppins-semibold", fixedSize: 14))
                    }
                    .frame(width: 150, height: 92)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color("Lgray"), radius: 2, x: 1, y: 1)
                }
            }
        }
        .padding(.top, 8)
    }
}

struct BestSellerItem: View {
    var product: Products
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            AsyncImage(
                url: URL(string: product.product_image[0].image),
                content: {
                    image in
                    image.image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 48 - 16, height: 92)
                        .clipped()
                        .padding(.bottom, 12)
                        .padding(.top, 12)
                        .cornerRadius(4)
                }
            )
            
            ItemTag(title: product.category.name)
            
            Text(product.name)
                .foregroundColor(Color.black)
                .font(.custom("poppins-semibold", fixedSize: 18))
                .padding(.top, 6)
            
            Text("IDR. " + df2so(_: Double(product.price)))
                .foregroundColor(Color("NewOrange"))
                .font(.custom("poppins-semibold", fixedSize: 14))
                .padding(.top, 6)
                .padding(.bottom)
        }
        .frame(width: UIScreen.main.bounds.width - 48, height: 205)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color("Lgray"), radius: 2, x: 1, y: 1)
        .padding(.top, 16)
        .padding(.bottom, 12)
        .padding(.trailing, 24)
    }
}

struct SuperRareSection: View {
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Super Rare Shoes")
                        .foregroundColor(Color.black)
                        .font(.custom("poppins-semibold", fixedSize: 14))
                    Text("Get super rare shoes now before it’s too late !")
                        .foregroundColor(Color.gray)
                        .font(.custom("poppins-regular", fixedSize: 12))
                        .padding(.top, 2)
                }
                
                Spacer()
            }
            
            HStack(spacing: 0.0) {
                SuperRareItem(image: "Shoe1", category: "Hiking", name: "Don Issue 2 Shoes", price: 670000)
                Spacer()
                SuperRareItem(image: "Shoe2", category: "Training", name: "Harden Vol 4 Shoes", price: 720000)
            }
            .padding(.top, 16)
            
            HStack(spacing: 0.0) {
                SuperRareItem(image: "Shoe3", category: "Training", name: "Pro Boost Low Shoes", price: 850000)
                Spacer()
                SuperRareItem(image: "Shoe4", category: "Hiking", name: "Dame 7 Shoes", price: 950000)
            }
            .padding(.top, 16)
        }
        .padding(.horizontal, 24)
    }
}

struct SuperRareItem: View {
    var image: String
    var category: String
    var name: String
    var price: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            HStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 42, height: 42)
                    .clipped()
                
                Spacer()
                
                ItemTag(title: category)
            }
            .frame(width: .infinity)
            .padding(.horizontal, 10)
            
            Text(name)
                .foregroundColor(Color.black)
                .font(.custom("poppins-medium", fixedSize: 12))
                .padding(.leading, 10)
                .padding(.top, 8)
            
            Text("IDR. " + df2so(Double(price)))
                .foregroundColor(Color("NewOrange"))
                .font(.custom("poppins-semibold", fixedSize: 10))
                .padding(.leading, 10)
                .padding(.top, 4)
        }
        .frame(width: (UIScreen.main.bounds.width / 2) - 31, height: 107)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color("Lgray"), radius: 2, x: 1, y: 1)
    }
}

struct PopularSection: View {
    var shoes: [Products]
    var loading: Bool
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Popular Shoes")
                        .foregroundColor(Color.black)
                        .font(.custom("poppins-semibold", fixedSize: 14))
                    Text("Get popular products right now !")
                        .foregroundColor(Color.gray)
                        .font(.custom("poppins-regular", fixedSize: 12))
                        .padding(.top, 2)
                }
                
                Spacer()
            }
            .padding(.leading, 24)
            
            ZStack {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 0.0) {
                        HStack {}.frame(width: 24)
                        ForEach(shoes) { shoe in
                            PopularItem(product: shoe)
                        }
                        HStack {}.frame(width: 4)
                    }
                })
                
                if (loading) {
                    VStack {
                        Indicator()
                        Text("Getting Data...")
                            .font(.custom("poppins-semibold", fixedSize: 14))
                    }
                    .frame(width: 150, height: 92)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color("Lgray"), radius: 2, x: 1, y: 1)
                }
            }
        }
        .padding(.top, 16)
    }
}

struct PopularItem: View {
    var product: Products
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            HStack {
                ItemTag(title: product.category.name)
                Spacer()
            }
            .padding(.top, 20)
            .padding(.leading, 20)
            
            AsyncImage(
                url: URL(string: product.product_image[0].image),
                content: {
                    image in
                    image.image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 215, height: 120)
                        .clipped()
                        .padding(.top, 20)
                }
            )
            
            Text(product.name)
                .foregroundColor(Color.black)
                .font(.custom("poppins-semibold", fixedSize: 18))
                .padding(.leading, 20)
                .padding(.top, 24)
            
            Text("IDR. " + df2so(Double(product.price)))
                .foregroundColor(Color("NewOrange"))
                .font(.custom("poppins-semibold", fixedSize: 14))
                .padding(.leading, 20)
                .padding(.top, 6)
            
            Spacer()
        }
        .frame(width: 215, height: 278)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color("Lgray"), radius: 2, x: 1, y: 1)
        .padding(.top, 16)
        .padding(.bottom, 14)
        .padding(.trailing, 20)
    }
}

struct CategoryModel : Identifiable {
    var id: Int
    var value: String
}

struct CategorySection: View {
    @ObservedObject var fetch: ShoesService
    @State var current = "All Shoes"
    
    @State var categories: [CategoryModel] = [
        CategoryModel(id: 0, value: "All Shoes"),
        CategoryModel(id: 1, value: "Running"),
        CategoryModel(id: 2, value: "Training"),
        CategoryModel(id: 3, value: "Basketball"),
        CategoryModel(id: 4, value: "Hiking"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 0.0) {
                HStack {}.frame(width: 24)
                ForEach(categories) { data in
                    CategoryItem(
                        title: data.value,
                        active: current == data.value,
                        onPress: {
                            current = data.value
                            fetch.getByCategoryId(id: data.id)
                        }
                    )
                }
                HStack {}.frame(width: 8)
            }
        })
    }
}

struct CategoryItem: View {
    var title: String
    var active: Bool = false
    var onPress: () -> Void
    
    var body: some View {
        Button(
            action: {
                onPress()
            }, label: {
                VStack {
                    Text(title)
                        .foregroundColor(active ? Color.white : Color("NewOrange"))
                        .font(.custom("poppins-light", fixedSize: 13))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(
                                    Color("NewOrange"),
                                    lineWidth: 2
                                )
                        )
                }
                .background(active ? Color("NewOrange") : Color.white)
                .border(Color("NewOrange"))
                .cornerRadius(12)
                .padding(.trailing, 16)
            }
        )
    }
}

struct NewArivalSection: View {
    var shoes: [Products]
    var loading: Bool
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("New Arrivals")
                        .foregroundColor(Color.black)
                        .font(.custom("poppins-semibold", fixedSize: 14))
                    Text("Get new products right now !")
                        .foregroundColor(Color.gray)
                        .font(.custom("poppins-regular", fixedSize: 12))
                        .padding(.top, 2)
                }
                
                Spacer()
            }
            .padding(.leading, 24)
            .padding(.bottom, 16)
            
            if (loading) {
                VStack {
                    Indicator()
                    Text("Getting Data...")
                        .font(.custom("poppins-semibold", fixedSize: 14))
                }
                .frame(width: 150, height: 92)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color("Lgray"), radius: 2, x: 1, y: 1)
            }
            
            ForEach(shoes) { shoe in
                NewArivalItem(product: shoe, onPress: {})
            }
            
        }
        .padding(.top, 8)
    }
}

struct NewArivalItem: View {
    var product: Products
    var onPress: () -> Void
    
    var body: some View {
        HStack(spacing: 0.0) {
            
            AsyncImage(
                url: URL(string: product.product_image[0].image),
                content: {
                    image in
                    image.image?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 118, height: 118)
                        .clipped()
                        .padding(.horizontal, 16)
                }
            )
                
            
            VStack(alignment: .leading, spacing: 0.0) {
                ItemTag(title: product.category.name)
                
                Text(product.name)
                    .foregroundColor(Color.black)
                    .font(.custom("poppins-semibld", fixedSize: 14))
                    .padding(.top, 8)
                
                Text(product.desc)
                    .foregroundColor(Color.gray)
                    .font(.custom("poppins-regular", fixedSize: 10))
                    .padding(.top, 8)
                    .lineLimit(2)
                    .padding(.trailing, 16)
                
                HStack {
                    Text("IDR. " + df2so(Double(product.price)))
                        .foregroundColor(Color("NewOrange"))
                        .font(.custom("poppins-semibold", fixedSize: 14))
                    
                    Spacer()
                    
                    Button(
                        action: {
                            onPress()
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(width: 58, height: 24)
                                    .foregroundColor(Color("NewOrange"))
                                
                                Text("Buy")
                                    .foregroundColor(Color.white)
                                    .font(.custom("poppins-regular", fixedSize: 10))
                            }
                        }
                    )
                    .padding(.trailing, 18)
                }
                .padding(.top, 10)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 48, height: 150)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("Lgray"), radius: 2, x: 1, y: 1)
        .padding(.bottom, 20)
    }
}

struct ItemTag: View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("poppins-regular", fixedSize: 10))
                .padding(.vertical, 2)
                .padding(.horizontal, 8)
                .background(Color("NewOrange"))
                .foregroundColor(Color.white)
                .cornerRadius(4)
        }
    }
}

struct BottomMenu: View {
    var body: some View {
        ZStack {
            HStack {}
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .background(Color.white)
                .shadow(color: .black, radius: 3.5, x: 0, y: 5)
            HStack(alignment: .bottom, spacing: 50) {
                BottomMenuItem(icon: "HomeIcon", menu: "Home", color: "NewOrange")
                BottomMenuItem(icon: "ExploreIcon", menu: "Explore", color: "OrangeD")
                BottomMenuItem(icon: "LoveIcon", menu: "Wish", color: "OrangeD")
                BottomMenuItem(icon: "ProfileIcon", menu: "Profile", color: "OrangeD")
            }
            .padding(.bottom, -10)
        }
    }
}

struct BottomMenuItem: View {
    var icon: String
    var menu: String
    var color: String
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image(icon)
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
                .clipped()
            Text("Home")
                .foregroundColor(Color(color))
                .font(.custom(color != "" ? "poppins-medium" : "poppins-regular", fixedSize: 14))
                .padding(.top, 2)
        }
    }
}

struct CustomRadius: Shape {
    var corner: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

func df2so(_ price: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = "."
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: price as NSNumber)!
}

struct Indicator : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor(Color("NewOrange"))
        return indi
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        uiView.startAnimating()
    }
}

struct ShoesDataView_Previews: PreviewProvider {
    static var previews: some View {
        ShoesDataView()
    }
}
