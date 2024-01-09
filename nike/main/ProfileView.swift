//
//  ProfileView.swift
//  nike
//
//  Created by CSF on 09.01.2024.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        
        VStack {
            
            HStack(spacing: 0) {
                VStack(spacing: 0){
                    Image("profile_1_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Image("profile_2_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                VStack(spacing: 0){
                    Image("profile_1_2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Image("profile_2_2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            
            HStack {
                Text("Welcome to the \nNike App")
                    .font(Font.custom("Inter", size: 24.0))
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
            
            
        }
        
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
