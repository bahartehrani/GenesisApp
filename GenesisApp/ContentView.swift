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
                HStack {
                    Text("Recently Studied")
                        .font(Font.custom("Lato-Bold", size: 24))
                        .padding(18)
                    
                    Spacer()
                }
                
                //ScrollView
                
                // Browse by Topic
                HStack {
                    Text("Browse By Topic")
                        .font(Font.custom("Lato-Bold", size: 24))
                        .padding(18)
                    
                    Spacer()
                }
                
                // ScrollView
                
                Spacer()
                
            }
            .navigationBarItems(
                leading: Button(action: {
                    // Actions
                }, label: {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .padding()
                    
                }),
                trailing: Button(action: {
                // Actions
                }, label: {
                    Image("TopProfileIcon")
                        .foregroundColor(.black)
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
