//
//  ContentView.swift
//  nike
//
//  Created by CSF on 27.12.2023.
//

import SwiftUI

struct WelcomeView: View {
    @State var showStartView = false
    
    var body: some View {
        if(showStartView){
            StartView()
        }else{
            WelcomeScreen(showStartView: $showStartView)
        }
    }
}

struct WelcomeScreen: View {
    @Binding var showStartView: Bool
    @State var presentSheet = false
    
    var welcomeText = "Nike App\nBringing Nike Members\nthe best products,\ninspiration and stories\nin sport."
    var joinButtonText = "Join Us"
    var signButtonText = "Sign In"
    
    var body: some View{
        NavigationView {
            VStack{
                Color.clear
                
                HStack{
                    Image("nike_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width:  150, height: 150)
                    Spacer()
                }
                
                Color.clear
                    .overlay{
                        VStack{
                            HStack{
                                Text(welcomeText)
                                    .font(Font.custom("Inter", size: 28.0))
                                    .fontWeight(.bold)
                                    .minimumScaleFactor(0.7)
                                    .foregroundStyle(.white)
                                    .padding([.leading], 32)
                                    .padding([.bottom], 16)
                                
                                Spacer()
                            }
                            
                            HStack{
                                Button(action: {
//                                    showStartView = true
                                    presentSheet = true
                                }, label: {
                                    Text(joinButtonText)
                                        .font(Font.custom("Inter", size: 16.0))
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.black)
                                })
                                .frame(minHeight: 50)
                                .background(Capsule()
                                    .foregroundStyle(.white))
                                
                                Button(action: {
                                    showStartView = true
                                }, label: {
                                    Text(signButtonText)
                                        .font(Font.custom("Inter", size: 16.0))
                                        .frame(maxWidth: .infinity)
                                        .foregroundStyle(.white)
                                })
                                .frame(minHeight: 50)
                                .background(Capsule()
                                    .strokeBorder(.white, lineWidth: 1))
                            }
                            .padding([.bottom], 32)
                            .padding([.leading, .trailing], 32)
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .background(AnyView(ZStack{
                Image("girl").resizable()
                
                LinearGradient(
                    colors: [.clear, .black],
                    startPoint: UnitPoint(x: 0, y: 0),
                    endPoint: UnitPoint(x: 0, y: 1)
                )})
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all))
        }.sheet(isPresented: $presentSheet) {
            RegistrationView()
                .presentationDetents([.medium, .large])
        }
    }
}

struct SplashView: View {
    var body: some View {
        ZStack {
            AnyView(Color(.black))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)

            Image("nike_logo")
                .resizable()
                .scaledToFill()
                .frame(width: .infinity, height: 0)
                .foregroundStyle(.white)
        }
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
