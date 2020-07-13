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
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
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
                
                
            }.padding(.top)
            
            Spacer()
            
            
            VStack {
                
                Button(
                    action: {
                        //
                },
                    label: {
                        Text("Sign Up")
                        .roundedButtonFilledStyle()
                    }).padding()
                
                Button(
                    action: {
                        //
                },
                    label: {
                        Text("Log In")
                        .roundedButtonFilledStyle()
                }).padding(.horizontal)
                
                
            }.padding(.bottom,50)
            
        }
        
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
