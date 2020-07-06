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
    @State var subTopic : String
    
    
    var body: some View {
        Button(action: {
            //
        }) { 
            VStack {
                Text(mainTopic + ":")
                    .font(Font.custom("Lato-Thin", size: 18))
                Text(subTopic)
                    .font(Font.custom("Lato-Bold", size: 28))
            }
                .foregroundColor(.black)
                .frame(width: 240, height: 80)
                .overlay(
            
                    RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1)
            
                )
        }
    }
}

struct RecentlyStudiedCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyStudiedCardView(mainTopic: "Managing", subTopic: "Budgeting")
    }
}
