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
    
    @State var fillerRS = [
        "Managing" : "Budgeting",
        "Spending" : "Loans",
        "Student Specific" : "FAFSA"
    ]
    
    @State var searchQuery = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    
                    // .font(Font.custom("Lato-Black", size: 20))
                    
                    
                    // Profile Icon, possible a ? icon to learn more,
                    // like an "Our Mission" page
                    
                    VStack {
                        
                        // Welcome Sign
                        Text("Welcome, " + "Daisy")
                        .font(Font.custom("Lato-Bold", size: 28))
                        
                        Text("What would you like to learn today?")
                        .font(Font.custom("Lato-Thin", size: 18))
                            .padding(.vertical, 12)
                        
                        
                        // Search Bar
                        SearchBar(text: $searchQuery)
                    }
                    .padding(.top,-30)
                    
                    
                    VStack {
                        // Recently Studied
                        HStack {
                            Text("Recently Studied")
                                .font(Font.custom("Lato-Bold", size: 24))
                                .padding(.horizontal,16)
                                .padding(.top,11)
                            
                            Spacer()
                        }
                        
                        ScrollView (.horizontal) {
                            
                            HStack {
                                ForEach(self.fillerRS.map{$0.key}.indices) { index in
                                    RecentlyStudiedCardView(mainTopic: (self.fillerRS.map{$0.key})[index], subTopic: (self.fillerRS.map{$0.value})[index])
                                        .padding(.horizontal,6)
                                }
                            }
                                .padding(.horizontal)
                                .padding(.vertical,11)
                            
                        }
                        
                        
                        // Browse by Topic
                        HStack {
                            Text("Browse By Topic")
                                .font(Font.custom("Lato-Bold", size: 24))
                                .padding(.horizontal,18)
                                .padding(.vertical,6)
                            
                            Spacer()
                        }
                        
                        VStack {
                            
                            HStack {
                                
                                MainTopicCardView(mainTopic: "Savings")
                                    .padding(.trailing,11)
                                
                                MainTopicCardView(mainTopic: "Spending")
                                
                            }.padding(.vertical,11)
                            
                            HStack {
                                
                                MainTopicCardView(mainTopic: "Managing")
                                    .padding(.trailing,11)
                                
                                MainTopicCardView(mainTopic: "Investing")
                                
                            }.padding(.vertical,11)
                            
                            HStack {
                                
                                MainTopicCardView(mainTopic: "Student\nSpecifics")
                                    .padding(.horizontal,22)
                                
                                Spacer()
                                
                            }.padding(.vertical,11)
                                

                        }.padding(.top,11)
                    }
                    
                    Spacer()
                    
                }
                
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
