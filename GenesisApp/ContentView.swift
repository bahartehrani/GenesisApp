//
//  ContentView.swift
//  GenesisApp
//
//  Created by Productivity on 7/2/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showProfile = false
    
    // @EnvironmentObject var user info : UserData
    @State var searchQuery = ""

    var body: some View {
        NavigationView {
            VStack {
                
                
                // .font(Font.custom("Lato-Black", size: 20))
                
                
                // Profile Icon, possible a ? icon to learn more,
                // like an "Our Mission" page
                
                
                // Welcome Sign
                Text("Welcome, " + "Daisy")
                .font(Font.custom("Lato-Bold", size: 28))
                
                Text("What would you like to learn today?")
                .font(Font.custom("Lato-Thin", size: 18))
                    .padding(.vertical, 12)
                
                
                // Search Bar
                SearchBar(text: $searchQuery)
                
                
                
                // Recently Studied
                
                // Browse by Topic
                
            }
            .navigationBarItems(trailing:
                Button(action: {
                    //
                }, label: {
                    Image("TopProfileIcon")
                        .padding()
                })
            )
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
