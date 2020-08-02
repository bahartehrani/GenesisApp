//
//  RecentlyStudiedCardView.swift
//  GenesisApp
//
//  Created by Productivity on 7/6/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct RecentlyStudiedCardView: View {
    @State var mainTopic : String
    @State var title : String
    @State var primaryColor : Color
    
    
    var body: some View {
//        Button(action: {
//            //
//        }) {
            VStack(spacing: 4.0) {
                Text(mainTopic + ":")
                    .font(Font.custom("Lato-Bold", size: 18))
                Text(title)
                    .font(Font.custom("Lato-Thin", size: 20))
                    .multilineTextAlignment(.center)
            }
                .foregroundColor(.black)
            .padding(.horizontal, 12)
                .frame(width: 230, height: 85)
                .background(primaryColor.cornerRadius(20).shadow(radius: 1))
                .overlay(
            
                    RoundedRectangle(cornerRadius: 20).stroke(primaryColor, lineWidth: 1)
                    
            
                )
//        }
    }
}

struct RecentlyStudiedCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyStudiedCardView(mainTopic: "Managing", title: "Learning to Investments", primaryColor: .secondaryGold)
    }
}
