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
    @Binding var toggle : Bool
    
    var body: some View {
        
        
        
        
        VStack {
            Text(mainTopic)
                .font(Font.custom("Lato-Bold", size: 22))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Spacer()
        }
            .frame(width: (UIScreen.main.bounds.width - 56)/2, height: (UIScreen.main.bounds.width - 56)/2)
            .overlay(
        
                RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1)
        
            )
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    self.toggle = true
                }
            }
        
    }
}

struct MainTopicCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainTopicCardView(mainTopic: "Savings", toggle: .constant(false))
    }
}
