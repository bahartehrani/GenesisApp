//
//  WeeklyTipView.swift
//  GenesisApp
//
//  Created by Productivity on 7/15/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct WeeklyTipView: View {
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("Weekly Tip")
                    .font(Font.custom("Lato-Black", size: 24))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        //
                    }) {
                        Image("Backward arrow small")
                            .foregroundColor(.secondaryText)
                    }
                    
                    Text("7/03 - 7/10")
                        .font(Font.custom("Lato-Black", size: 18))
                        .foregroundColor(.secondaryText)
                    
                    Button(action: {
                        //
                    }) {
                        Image("Backward arrow small")
                            .foregroundColor(.secondaryText)
                            .rotationEffect(.degrees(180))
                    }
                }
                
            }.padding(.horizontal,6)
            
            ScrollView {
                
                Text("Did you know it’s almost 5 times more expensive to order from a restaurant than it is to cook at home? We love eating out too, but staying in is sure to result in tastier savings.")
                    .font(Font.custom("Lato-Regular", size: screen.height < 800 ? 16 : 18))
                    .foregroundColor(.white)
                
            }.padding(.horizontal,4)
                .padding(.top,-6)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: screen.height / 5)
        .padding()
        .background(Color.primaryGreen)
        .cornerRadius(21)
        .padding(.horizontal)
        .shadow(radius: 2)
    
    }
}

struct WeeklyTipView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyTipView()
    }
}
