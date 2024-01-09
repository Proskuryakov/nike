//
//  StartView.swift
//  nike
//
//  Created by CSF on 27.12.2023.
//

import SwiftUI

struct StartView: View {
    @State var showMainView = false
    
    var body: some View {
        if(showMainView){
            MainView()
        }else{
            StartScreen(showMainView: $showMainView)
        }
    }
}

struct StartScreen: View {
    @Binding var showMainView: Bool

    public init(showMainView: Binding<Bool>){
        self._showMainView = showMainView
    }
    
    @State var step = 0
    var maxSteps = 4
    
    private var columns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: 16),
        count: 4
    )

    var shoeSizes =
    ["4", "4.5", "5", "5.5",
     "6", "6.5", "7", "7.5",
     "8", "8.5", "9", "9.5",
     "10", "10.5", "11", "11.5",
     "12", "12.5", "13", "13.5",
     "14", "14.5", "15", "16",
     "17", "18"]
    
    var categories = [
//        CategoryModel(imageName: "ct_1", category: "Air Max"),
        CategoryModel(imageName: "ct_2", category: "Baseball"),
        CategoryModel(imageName: "ct_3", category: "Big & Tall"),
        CategoryModel(imageName: "ct_4", category: "Cross-Training"),
        CategoryModel(imageName: "ct_5", category: "Dance"),
        CategoryModel(imageName: "ct_6", category: "Lacrosse"),
        CategoryModel(imageName: "ct_7", category: "Maternity"),
        CategoryModel(imageName: "ct_8", category: "N7"),
        CategoryModel(imageName: "ct_9", category: "Nike Sportswear"),
    ]
    
    
    var body: some View {
        VStack{
            
            ProgressView(value: Double(step), total: Double(maxSteps))
                .background(Color.gray)
                .tint(.white)
                .frame(width: 200)
                .padding()
            
            
            
            switch(step){
            case 0:
                HeaderText("To personalize your\nexperience and\nconnect you to sport,\nwe've got a few\nquestions for you.")
            case 1:
                VStack{
                    HeaderText("First up, which\nproducts do you use\nthe most?")

                    ScrollView{
                        ListItem(item: CategoryModel(imageName: "mens", category: "Mens"))
                        
                        CategorySeparator()
                        
                        ListItem(item: CategoryModel(imageName: "womens", category: "Womens"))
                        
                        Text("Any others?")
                            .font(Font.custom("Inter", size: 35.0))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.horizontal], 16)
                            .padding([.top], 64)
                        
                        ListItem(item: CategoryModel(imageName: "boys", category: "Boys"))
                        
                        CategorySeparator()
                        
                        ListItem(item: CategoryModel(imageName: "girls", category: "Girls"))
                    }
                }
                .frame(maxWidth: .infinity)
            case 2:
                VStack{
                    HeaderText("What’s your shoe size?")
                    
                    LazyVGrid(columns: columns, spacing: 16){
                        ForEach(shoeSizes, id: \.self){ size in
                            ShoeSizeItem(text: size)
                        }
                    }
                    .padding([.horizontal], 16)
                }
            case 3:
                List{
                    ForEach(categories){ category in
                        ListItem(item: category)
                            .listRowBackground(Color.clear)
                    }
                }
                .listStyle(.plain)
            case 4:
                HeaderText("Stay in the know with\nnotifications about\nFirst Access to\nproducts, invites to\nexperiences,\npersonalized offers,\nand order updates.")
            default:
                Color.clear
                    .frame(maxWidth: .infinity)
            }
            
            
            Spacer()

            Button(action: {
                if(step < maxSteps){
                    step += 1
                } else {
                    showMainView = true
                }
            },label: {
                Text(step == 0 ? "Get Started" : "Next")
                    .font(Font.custom("Inter", size: 16.0))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
            })
            .frame(width: 162,height: 50)
            .background(Capsule().foregroundStyle(.white))
            .padding([.bottom], 16)
            
        }
        .background(Background(step: $step))
    }
    
}

struct Background: View {
    @Binding var step: Int
    var body: some View{
        switch(step){
        case 0:AnyView(
            ZStack{
                Image("start_screen_back")
                    .resizable()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)

        case 2, 3, 4:
            AnyView(
                ZStack{
                    Image("questions")
                        .resizable()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)

        default:
            AnyView(Color(.black))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        }
    }
}

struct HeaderText: View {
    var text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View{
        Text(text)
            .font(Font.custom("Inter", size: 33.0))
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal], 16)
    }
}

struct CategorySeparator: View {

    var body: some View{
        Rectangle()
            .frame(width: .infinity, height: 1)
            .foregroundStyle(.gray)
            .padding([.horizontal], 16)
    }
}

struct ListItem: View {
    var item: CategoryModel
    @State var clicked = false
    
    var body: some View {
        HStack{
            Image(item.imageName)
                .mask{
                    Circle()
                }
                .frame(width: 64,height: 64)
            
            Text(item.category)
                .font(Font.custom("Inter", size: 23.0))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray)
            
            Image(systemName: clicked ? "checkmark.circle.fill" : "circle")
                .resizable()
                .foregroundStyle(.gray)
                .frame(width: 25, height: 25)
        }
        .padding(16)
        .onTapGesture {
            clicked.toggle()
        }
    }
}

struct ShoeSizeItem: View {
    var text: String
    @State var selected = false
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.white)
                .opacity(selected ? 1 : 0.3)

            Text(text)
                .frame(height: 50)
        }
        .onTapGesture {
            selected.toggle()
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
