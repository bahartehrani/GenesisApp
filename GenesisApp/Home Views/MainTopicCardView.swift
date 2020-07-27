//
//  MainTopicCardView.swift
//  GenesisApp
//
//  Created by Productivity on 7/6/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct MainTopicCardView: View {
    @State var mainTopic : String
    @State var primaryColor : Color
    @State var topicImage : String
    @Binding var toggle : Bool
    
    var body: some View {
        
        
        
        
        ZStack {
            
            VStack {
                HStack {
                    
                    Text(mainTopic)
                    .font(Font.custom("Lato-Bold", size: 22))
                    .foregroundColor(.white)
                        
                    
                    Spacer()
                    
                }.padding(.horizontal)
                .padding(.top,8)
                
                Spacer()
            }
            
            
            VStack {
                
                
                Image(topicImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding([.top,.trailing])
                    .offset(x: -15, y : 30)
                
                Spacer()
            }
                .frame(width: (UIScreen.main.bounds.width - 56)/2, height: (UIScreen.main.bounds.width - 56)/2)
                .overlay(
            
                    RoundedRectangle(cornerRadius: 20).stroke(primaryColor, lineWidth: 1)
                        
            
                )
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        self.toggle = true
                    }
            }
            
            
            
            
        }
            .frame(width: (UIScreen.main.bounds.width - 56)/2, height: (UIScreen.main.bounds.width - 56)/2)
            .background(primaryColor.cornerRadius(20).shadow(radius: 1))
        
    }
}

struct MainTopicCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainTopicCardView(mainTopic: "Savings", primaryColor: .secondaryMint, topicImage: "Home - Investing Illustration", toggle: .constant(false))
    }
}
//
//Text(mainTopic)
//.font(Font.custom("Lato-Bold", size: 22))
//.foregroundColor(.black)
//.frame(maxWidth: .infinity, alignment: .leading)
//.padding()
