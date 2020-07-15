//
//  SetupView.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    
    @State var currentPageIndex = 0
    @EnvironmentObject var userInfo : UserData
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var session: SessionStore
    
    @State var showSignUp = false
    @State var showLogIn = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                VStack {
                    
                    Image("Landing Page Logo")
                        .padding(.bottom,-50)
                    
                    Text("Figure")
                        .titleStyle()
                        .foregroundColor(.primaryBlue)
                    
                    Text("Got that coin? Learn how to work it.")
                        .font(Font.custom("Lato-Thin", size: 18))
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: SignUpViewCollect(signUpStep: true)
                    .environmentObject(userInfo)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$showSignUp) {
                        EmptyView()
                    }.isDetailLink(false)
                    
                    NavigationLink(destination: LoginView(showLogIn: self.$showLogIn)
                    .environmentObject(userInfo)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$showLogIn) {
                        EmptyView()
                    }.isDetailLink(false)
                    
                    
                }.padding(.top)
                .offset(x:0,y:-40)
                
                Spacer()
                
                
                VStack {
                    
                    Button(
                        action: {
                            self.showSignUp = true
                    },
                        label: {
                            Text("Sign Up")
                            .roundedButtonFilledStyle()
                        }).padding()
                    
                    Button(
                        action: {
                            self.showLogIn = true
                    },
                        label: {
                            Text("Log In")
                            .roundedButtonHollowStyle()
                    }).padding(.horizontal)
                        .padding(.vertical,4)
                    
                    
                }.padding(.bottom,50)
                
            }
            .offset(x:0,y:-10)
            .navigationBarTitle("") //this must be empty
            .navigationBarBackButtonHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
