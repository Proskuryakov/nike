//
//  ShopDetailsView.swift
//  nike
//
//  Created by CSF on 09.01.2024.
//

import SwiftUI

struct ShopDetailsView: View {

    @State var selectedTab = 0
    var tabItems = ["All", "Tops & T-Shirts", "Hoodies & Pullove", "Socks", "Accessories & Equipment"]
    
    var products = [
        ProductCardModel(id: 1, imageName: "bs_1", status: .soldOut, title: "Nike Elite Pro", subtitle: "Basketball Backpack (32L) \n3 Colours", price: "85"),
        ProductCardModel(id: 5, imageName: "bs_5", status: .bestseller, title: "Nike Therma", subtitle: "Men’s Pullover Training \nHoodie", price: "33.97"),
        ProductCardModel(id: 2, imageName: "bs_2", status: .soldOut, title: "Nike Heritage", subtitle: "Basketball Backpack (32L) \n4 Colours", price: "40.97"),
        ProductCardModel(id: 3, imageName: "bs_3", title: "Jordan bag", subtitle: "Jordan \nbag \n2 Colours", price: "12.21"),
        ProductCardModel(id: 4, imageName: "bs_4", title: "Nike bag", subtitle: "Nike bag \n4 Colours", price: "34.99"),
        
        ProductCardModel(id: 6, imageName: "bs_6", title: "Sportwear Club", subtitle: "Fleece \nMen’s Pants ", price: "23.45"),
        ProductCardModel(id: 7, imageName: "bs_7", status: .bestseller, title: "Sportswear Club", subtitle: "Men’s Pullover \nTraining \nHoodie", price: "63.98"),
        ProductCardModel(id: 8, imageName: "bs_8", title: "Nike Dri-FIT Miler", subtitle: "Nike \nDri-FIT \nMiler", price: "12.21"),
        
    ]

    private var columns: [GridItem] = [
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8)
        ]
    
    var body: some View {
        VStack{
            TabBar(tabs: tabItems, selectedId: $selectedTab)
                .padding([.horizontal, .top])

            ScrollView{
                LazyVGrid(columns: columns, spacing: 16){
                    ForEach(products){ item in
                        ProductItem(product: item)
                    }
                }
            }

            Spacer()
        }
        .navigationTitle("Best Sellers")
        .toolbar{
            ToolbarItem{
                Image("search")
            }
        }
        .toolbar{
            ToolbarItem{
                Image("settings")
                    .padding(.horizontal)
            }
        }
    }
}



struct ProductItem: View {
    var product: ProductCardModel
    
    var body: some View {
        VStack{
            ZStack{
                Color.clear
                    .aspectRatio(1, contentMode: .fit)
                    .overlay(
                        Image(product.imageName)
                            .resizable()
                            .scaledToFill()
                    )
                    .clipShape(Rectangle())
                VStack{
                    HStack{
                        Spacer()
                        Image("like")
                            .padding()
                    }
                    Spacer()
                }
            }

            VStack{
                HStack {
                    Text(product.status.rawValue)
                        .fontWeight(.semibold)
                        .foregroundStyle(.orange)

                    Spacer()
                }

                HStack{
                    Text(product.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)

                    Spacer()
                }

                HStack{
                    Text(product.subtitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)

                    Spacer()
                }

                HStack{
                    Text("US$" + product.price)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)

                    Spacer()
                }

            }.padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ShopDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailsView()
    }
}
