//
//  MainView.swift
//  nike
//
//  Created by CSF on 27.12.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView() {
            Text("Home").tabItem {
                VStack{
                    Image("house")
                    Text("Home")
                }
            }.tag(1)
            ShopView().tabItem {
                VStack{
                    Image("search")
                    Text("Shop")
                }
            }.tag(2)
            Text("Favorites").tabItem {
                VStack{
                    Image("heart")
                    Text("Favorites")
                }
            }.tag(3)
            Text("Bag").tabItem {
                VStack{
                    Image("bag")
                    Text("Bag")
                }
            }.tag(4)
            ProfileView().tabItem {
                VStack{
                    Image("person")
                    Text("Profile")
                }
            }.tag(5)
        }
        .tint(.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
