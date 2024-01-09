//
//  ShopView.swift
//  nike
//
//  Created by CSF on 27.12.2023.
//

import SwiftUI

struct ShopView: View {
    
    @State var selectedTab = 0
    var tabItems = ["Men", "Women", "Kid"]
    var title = "Shop"
    
    var horizontalItems = [
        ImageCardModel(id: 1, imageName: "shop_h_1", text: "Best Sellers"),
        ImageCardModel(id: 2, imageName: "shop_h_2", text: "Featured in Nike Air"),
        ImageCardModel(id: 3, imageName: "shop_h_1", text: "Best Sellers"),
        ImageCardModel(id: 4, imageName: "shop_h_2", text: "Featured in Nike Air")
    ]
    
    
    var verticalItems = [
        ImageCardModel(id: 1, imageName: "shop_v_1", text: "New & Featured"),
        ImageCardModel(id: 2, imageName: "shop_v_2", text: "Shoes"),
        ImageCardModel(id: 3, imageName: "shop_v_1", text: "New & Featured"),
        ImageCardModel(id: 4, imageName: "shop_v_2", text: "Shoes")
    ]
    
    var body: some View {
        
        NavigationStack{
            ScrollView{

                TabBar(tabs: tabItems, selectedId: $selectedTab)
                    .padding([.horizontal, .top])
                    .padding([.bottom], -8)

                Divider()

                HStack{
                    Text("Must-Haves, Best Sellers & More ")
                        .fontWeight(.semibold)
                        .font(Font.custom("Inter", size: 20.0))
                        .padding()
                    Spacer()
                }
                
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(horizontalItems){item in
                            NavigationLink(destination: ShopDetailsView()){
                                HorizontalImageCard(card: item)
                                    .padding(1)
                            }
                        }
                    }
                }
                .scrollIndicators(.never)
                .padding([.leading, .top])
                ScrollView(.vertical){
                    LazyVStack{
                        ForEach(verticalItems){item in
                            NavigationLink(destination: ShopDetailsView()){
                                VerticalImageCard(card: item)
                            }
                        }
                    }
                }
                
                .padding([.top])
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem{
                    Image("search")
                }
            }
        }
        .tint(.black)
    }
}


struct HorizontalImageCard: View {
    var card: ImageCardModel
    
    var body: some View{
        VStack{
            Color.clear
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Image(card.imageName)
                        .resizable()
                        .scaledToFill()
                    )
                .clipShape(Rectangle())
                .frame(width: 250)

            HStack{
                Text(card.text)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)

                Spacer()
            }
        }
    }
}


struct VerticalImageCard: View {
    var card: ImageCardModel
    
    var body: some View {
        ZStack{
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack{
                Text(card.text)
                    .font(Font.custom("Inter", size: 20.0))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                
                Spacer()
            }
        }
    }
}


struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
