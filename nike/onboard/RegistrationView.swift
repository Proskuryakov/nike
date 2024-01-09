//
//  RegistrationView.swift
//  nike
//
//  Created by CSF on 09.01.2024.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        VStack {
            HStack{
                Image("nike_logo")
                    .resizable()
                    .colorInvert()
                    .scaledToFill()
                    .frame(width: 60, height: 120)
                Spacer()
            }.padding([.bottom], -40)

            EmailFormView()

        }.padding([.horizontal], 40)
    }
}


struct EmailFormView: View {
    
    @State var email: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enter your email to join us or sign in.")
                .font(Font.custom("Inter", size: 28.0))
                .fontWeight(.semibold)
                .padding([.vertical], 10)
            
            
            HStack {
                Text("United States")
                    .font(Font.custom("Inter", size: 16.0))
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                Text("Change")
                    .font(Font.custom("Inter", size: 16.0))
                    .underline()
                    .fontWeight(.semibold)
            }
            
            ZStack(alignment: .leading) {
                TextField("", text: $email)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(getEmailFormColor(email), lineWidth: 2)
                    }.padding([.vertical], 20)
                
                Text("Email")
                    .font(Font.custom("Inter", size: 12.0))
                    .background(Color.white)
                    .foregroundColor(getEmailFormColor(email))
                    .padding([.horizontal], 10)
                    .padding([.top], -28)
            }.padding([.bottom], 0)
            
            if (!isValidEmail(email)) {
                Text("Invalid email address")
                    .font(Font.custom("Inter", size: 12.5))
                    .foregroundColor(.red)
                    .padding([.top], -20)
            }
            
            
            
        }
    }
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return email == "" || emailPred.evaluate(with: email)
}

func getEmailFormColor(_ email: String) -> Color {
    return isValidEmail(email) ? .gray : .red
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
