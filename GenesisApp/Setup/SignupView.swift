//
//  SignupView.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    
    @State var typedPassword = ""
    @State var typedConfirmPassword = ""
    @State var agreed = false
    
    @EnvironmentObject var userInfo : UserData
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                HStack {
                    Text("Sign Up")
                    .font(Font.custom("Lato-Bold", size: 32))
                     
                    Spacer()
                }
                    .padding(.horizontal,36)
                    .padding(.vertical)
                
                
                
                VStack {
                    Group {
                        TextField("First Name", text: self.$userInfo.firstName)
                            .signUpTFStyle()
                            .padding(.vertical,8)
                            .autocapitalization(.words)
                            .keyboardType(.alphabet)
                            .disableAutocorrection(true)
                        
                        
                        
                        TextField("Last Name", text: self.$userInfo.lastName)
                            .signUpTFStyle()
                            .autocapitalization(.words)
                            .keyboardType(.alphabet)
                            .disableAutocorrection(true)
                        
                        
                        
                        TextField("Email", text: self.$userInfo.email)
                            .signUpTFStyle()
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                        
                        
                        
                        SecureField("Password", text: self.$typedPassword)
                            .signUpTFStyle()
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                        
                        
                        SecureField("Confirm Password", text: self.$typedConfirmPassword)
                            .signUpTFStyle()
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                        
                    }
                        .padding(.horizontal)
                        .padding(.vertical,8)
                }
                    
                
                HStack {
                    Button(action: {
                        self.agreed.toggle()
                    }, label: {
                        Image(systemName: self.agreed ? "checkmark.square.fill" : "square")
                            .foregroundColor(.primaryBlue)
                    })
                    
                    Text("I agree to the terms and conditions")
                        .font(.footnote)
                        .foregroundColor(.secondaryText)
                }.padding(.vertical)
                
                Spacer()
                
                Button(action: {
                    //
                }, label: {
                    Text("Next")
                    .roundedSmallButtonHollowStyle()
                }).padding(.vertical)
                
                
                Spacer()
                
                    
            }
                .offset(y: -30)
            .navigationBarItems(
            leading: Button(action: {
                // Action
            }, label: {
                Image("Backward arrow small")
                    .font(.system(size: 24))
                    .foregroundColor(.secondaryText)
                    .padding()
                
        }))
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().environmentObject(UserData())
    }
}
