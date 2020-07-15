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
    
    @EnvironmentObject var userInfo : UserData
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var session: SessionStore
    
    @State var toggleSpending = false
    @State var toggleProfile = false
    
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
                    
                    NavigationLink(destination: TopicView(mainTopic: "Spending", toggle: self.$toggleSpending)
                    .environmentObject(userInfo)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleSpending) {
                            EmptyView()
                    }.isDetailLink(false)
                    
                    NavigationLink(destination: AccountView(toggle: self.$toggleProfile)
                    .environmentObject(userInfo)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleProfile) {
                            EmptyView()
                    }.isDetailLink(false)
                    
                    // .font(Font.custom("Lato-Black", size: 20))
                    
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
                        // Recently Studied - hide if user hasn't clicked on anything
                        // if !recentContent.count == 0 then...
                    if self.userInfo.recentContent?.count != 0 {
                        VStack {
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
                        }
                        
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
                                
                                MainTopicCardView(mainTopic: "Savings", primaryColor: Color.secondaryGold, topicImage: "Home - Savings Illustration", toggle: .constant(false))
                                    .padding(.trailing,11)
                                
                                MainTopicCardView(mainTopic: "Spending", primaryColor: Color.primaryGreen, topicImage: "Home - Spending Illustration", toggle: self.$toggleSpending)
                                
                            }.padding(.vertical,11)
                            
                            HStack {
                                
                                MainTopicCardView(mainTopic: "Managing", primaryColor: Color.secondaryPink, topicImage: "Home - Management Illustration",toggle: .constant(false))
                                    .padding(.trailing,11)
                                
                                MainTopicCardView(mainTopic: "Investing",primaryColor: Color.secondaryMint, topicImage: "Home - Investing Illustration", toggle: .constant(false))
                                
                            }.padding(.vertical,11)
                            
                            HStack {
                                
                                MainTopicCardView(mainTopic: "Student\nSpecifics", primaryColor: Color.secondaryOrange, topicImage: "Home - Student Spec Illustration", toggle: .constant(false))
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
                    self.toggleProfile = true
                }, label: {
                    Image("TopProfileIcon")
                        .foregroundColor(.black)
                        .padding()
                    
                })
            )
            
        .navigationBarTitle("") //this must be empty
            .navigationBarBackButtonHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}

let screen = UIScreen.main.bounds
