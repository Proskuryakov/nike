//
//  CommonViews.swift
//  nike
//
//  Created by CSF on 09.01.2024.
//

import SwiftUI

struct TabBar:View {
    var tabs:[String]
    @Binding var selectedId: Int
    
    var body: some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<tabs.count, id: \.self){ id in
                    VStack {
                        Text(tabs[id])
                            .foregroundStyle(id == selectedId ? .black : .gray)
                            .fontWeight(.semibold)

                        Rectangle()
                            .frame(height: 3)
                            .foregroundStyle(id == selectedId ? .black : .white)
                    }
                    .onTapGesture {
                        selectedId = id
                    }
                    
                }.padding(.horizontal)
            }
        }
        .scrollIndicators(.never)
    }
}
