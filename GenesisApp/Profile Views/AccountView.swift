//
//  AccountView.swift
//  GenesisApp
//
//  Created by Productivity on 7/15/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject var userInfo : UserData
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        
        VStack {
            // Name
            HStack {
                Text("Daisy Zhang")
                .font(Font.custom("Lato-Bold", size: 32))
                
                Spacer()
            }
            .padding(.horizontal)
            
            // Edit Account
            HStack {
                
                Button(action: {
                    //
                }, label: {
                    Text("Edit Account")
                    .font(Font.custom("Lato-Regular", size: 18))
                    .foregroundColor(.secondaryText)
                })
                
                Spacer()
            }
            .padding(.vertical,6)
            .padding(.horizontal)
            
            // Weekly Tip
            WeeklyTipView()
                .padding(.vertical,8)
            
            // Weekly Expenses
            WeeklyBudgetView()
            
            // Starred Artifacts from underneath
            
            
            
        }
        // Home button
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(UserData())
    }
}
