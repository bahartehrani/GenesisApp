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
    
    @EnvironmentObject var topicArticles : ArticleStore
    
    @State var toggleSavings = false
    @State var toggleSpending = false
    @State var toggleManaging = false
    @State var toggleInvesting = false
    @State var toggleStudents = false
    @State var toggleTopic = false
    @State var currentTopic = " "
    
    @State var toggleProfile = false
    @State var toggleInfo = false
    
    @State var fillerRS = [
        "Managing" : "Budgeting",
        "Spending" : "Loans",
        "Student Specific" : "FAFSA"
    ]
    
    @State var searchQuery = ""

    var body: some View {
        NavigationView {
            ScrollView (showsIndicators: false) {
                VStack {
                    //Navigation for each page
                    NavigationLink(destination: TopicView(mainTopic: "Savings", backgroundColor: "secondaryGold", toggle: self.$toggleSavings, maintopicview: self.$topicArticles.maintopicviewSavings)
                    .environmentObject(userInfo)
                        .environmentObject(topicArticles)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleSavings) {
                            EmptyView()
                    }.isDetailLink(false)
                    
                    
                    NavigationLink(destination: TopicView(mainTopic: "Spending", backgroundColor: "primaryGreen", toggle: self.$toggleSpending, maintopicview: self.$topicArticles.maintopicviewSpending)
                    .environmentObject(userInfo)
                        .environmentObject(topicArticles)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleSpending) {
                            EmptyView()
                    }.isDetailLink(false)
                    
                    NavigationLink(destination: TopicView(mainTopic: "Managing", backgroundColor: "secondaryPink", toggle: self.$toggleManaging, maintopicview: self.$topicArticles.maintopicviewSpending)
                    .environmentObject(userInfo)
                        .environmentObject(topicArticles)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleManaging) {
                            EmptyView()
                    }.isDetailLink(false)
                    
                    NavigationLink(destination: TopicView(mainTopic: "Investing", backgroundColor: "secondaryMint", toggle: self.$toggleInvesting, maintopicview: self.$topicArticles.maintopicviewSpending)
                    .environmentObject(userInfo)
                        .environmentObject(topicArticles)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleInvesting) {
                            EmptyView()
                    }.isDetailLink(false)
                    
                    NavigationLink(destination: TopicView(mainTopic: "Student Specific", backgroundColor: "secondaryOrange", toggle: self.$toggleStudents, maintopicview: self.$topicArticles.maintopicviewSpending)
                    .environmentObject(userInfo)
                        .environmentObject(topicArticles)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleStudents) {
                            EmptyView()
                    }.isDetailLink(false)
                    
                    //Navigation for profile + info
                    NavigationLink(destination: InfoSubview1(toggle: self.$toggleInfo).environmentObject(userInfo).navigationBarBackButtonHidden(true)
//                        .statusBar(hidden: true)
                        ,isActive: self.$toggleInfo){
                            EmptyView()
                    }.isDetailLink(false)
                    
                    
                    NavigationLink(destination: AccountView(toggle: self.$toggleProfile)
                    .environmentObject(userInfo)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleProfile) {
                            EmptyView()
                    }.isDetailLink(false)
                    
                    // .font(Font.custom("Lato-Black", size: 20))
                    
                    VStack {
                        
                        // Welcome Sign
                        Text("Welcome, " + self.userInfo.firstName)
                        .font(Font.custom("Lato-Bold", size: 30))
                        
                        Text("What would you like to learn today?")
                        .font(Font.custom("Lato-Thin", size: 18))
                            .padding(.vertical, 12)
                        
                        
                        // Search Bar
                        SearchBar(text: $searchQuery)
                        
                        if !searchQuery.isEmpty {
                            SearchItems(searchQuery: self.$searchQuery)
                        }
                        
                        
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
                            
                            ScrollView (.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    ForEach(self.userInfo.recentContent!.indices, id: \.self) { index in
                                        RecentlyStudiedCardView(
                                            mainTopic: self.userInfo.recentContentMod[index].maintopic,
                                            subTopic: self.userInfo.recentContentMod[index].subtopic,
                                            primaryColor: colorToTopic[self.userInfo.recentContentMod[index].maintopic] ?? Color.primaryGreen)
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
                                .font(Font.custom("Lato-Bold", size: 26))
                                .padding(.horizontal,18)
                                .padding(.vertical,4)
                            
                            Spacer()
                        }
                        
                        VStack {
                            
                            HStack {
                                
                                MainTopicCardView(mainTopic: "Savings", primaryColor: Color.secondaryGold, topicImage: "Home - Savings Illustration", toggle: self.$toggleSavings)
                                    .padding(.trailing,7)
                                
                                MainTopicCardView(mainTopic: "Spending", primaryColor: Color.primaryGreen, topicImage: "Home - Spending Illustration", toggle: self.$toggleSpending)
                                
                                
                            }.padding(.bottom,7)
                            
                            HStack {
                                
                                MainTopicCardView(mainTopic: "Managing", primaryColor: Color.secondaryPink, topicImage: "Home - Management Illustration",toggle: self.$toggleManaging)
                                    .padding(.trailing,7)
                                
                                MainTopicCardView(mainTopic: "Investing",primaryColor: Color.secondaryMint, topicImage: "Home - Investing Illustration", toggle: self.$toggleInvesting)
                                
                            }.padding(.vertical,7)
                            
                            HStack {
                                
                                MainTopicCardView(mainTopic: "Student\nSpecific", primaryColor: Color.secondaryOrange, topicImage: "Home - Student Spec Illustration", toggle: self.$toggleStudents)
                                    .padding(.horizontal,21)
                                
                                Spacer()
                                
                            }.padding(.vertical,7)
                                

                        }.padding(.top,7)
                }
                    
                 Spacer()
                
                    
                }
                //clears old subtopics so it doesn't get messy
//                .onAppear(perform:{
//
//                print("removing..")
//                self.topicArticles.maintopicview.subtopics.removeAll()
//                self.topicArticles.maintopicview.description.removeAll()
//                print(self.topicArticles.maintopicview.subtopics)
//
//                }
//
//                )
                .onDisappear(perform: {
                    self.toggleTopic.toggle()
                    let choose = true
                    
                    switch choose {
                    case self.toggleSavings :
                        self.currentTopic = "savings"
                    case self.toggleSpending :
                        self.currentTopic = "spending"
                    case self.toggleManaging :
                        self.currentTopic = "spending"
                    case self.toggleInvesting :
                        self.currentTopic = "spending"
                    case self.toggleStudents :
                        self.currentTopic = "spending"
                    default :
                        self.toggleTopic.toggle()
                        print("Nothing huehue")
                    }

                    if self.toggleTopic {
                        self.topicArticles.fetchMainTopic(maintopic: self.currentTopic) { rt in
                            print("complete: Topic Found")
                            print(rt)
                            self.toggleTopic.toggle()
                        }
                    }
                    
//                    if self.toggleSpending {
//                        self.topicArticles.fetchMainTopic(maintopic: "spending") { rt in
//                            print("complete: Spending")
//                            print(rt)
//                        }
//                    }
                }
                )
                
            }
            .navigationBarItems(
                leading: Button(action: {
                    self.toggleInfo = true
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
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .statusBar(hidden: toggleInfo ? true : false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(toggleInfo: false).environmentObject(UserData())
        .environmentObject(ViewRouter())
        .environmentObject(ArticleStore())
    }
}

let screen = UIScreen.main.bounds
