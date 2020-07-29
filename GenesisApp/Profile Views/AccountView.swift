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
    @EnvironmentObject var topicArticles : ArticleStore
    
    @Binding var toggle : Bool
    
    @State var showArtifacts = false
    @State var showEditAccount = false
    @State var bottomState = CGSize.zero
    
    var body: some View {
        GeometryReader { geometry in
        ZStack {
            //GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center) {
                        
                        NavigationLink(destination: EditAccountView(showEditAccount: self.$showEditAccount)
                            .environmentObject(self.userInfo)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        , isActive: self.$showEditAccount) {
                                EmptyView()
                        }.isDetailLink(false)
                        
                        // Name
                        HStack {
                            Text(self.userInfo.firstName + " " + self.userInfo.lastName)
                            .font(Font.custom("Lato-Bold", size: 32))
                            
                            Spacer()
                            
                            Button(action: {
                                withAnimation {
                                    self.toggle = false
                                }
                            },
                                   label: {
                                    Image(systemName: "house")
                                        .font(.system(size: 20, weight: .light))
                                        .foregroundColor(.black)
                                        .padding(.bottom,6)
                            })
                        }
                        .padding(.horizontal,20)
                        .padding(.top)
                        
                        // Edit Account
                        
                        HStack {
                            
                            Button(action: {
                                self.showEditAccount.toggle()
                                print(screen.height)
                            }, label: {
                                Text(self.showArtifacts ? " " : "Edit Account")
                                .font(Font.custom("Lato-Regular", size: 18))
                                .foregroundColor(.secondaryText)
                            })
                            
                            Spacer()
                        }
                        .padding(.bottom,6)
                        .padding(.horizontal,20)
                        
                        
                        // Weekly Tip
                        WeeklyTipView()
                            .environmentObject(self.topicArticles)
                            .padding(.bottom,8)
                        
                        // Weekly Expenses
                        WeeklyBudgetView()
                        //.padding(.bottom, screen.height / 4)
                        
                        // Starred Artifacts from underneath
                        
//                        Rectangle()
//                            .frame(height: screen.height/4)
                        Spacer()
                        
                        }
                    .padding(.top,4)
                        
                        
                    //.edgesIgnoringSafeArea(.all)
                        //frame(maxHeight: geometry.size.height)
                        .frame(maxHeight: .infinity)
                    //.frame(height: geometry.size.height)
                       
                }.frame(height: geometry.size.height)
            }
            
            // Artifacts?
            StarredArtifactsView(showArtifacts: self.$showArtifacts, bottomState: self.$bottomState)
                .offset(x:0, y: screen.height < 800 ? screen.height / 1.125 : screen.height / 1.2)
                .offset(y: self.bottomState.height)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.6))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.bottomState = value.translation
                            if self.showArtifacts {
                                
                                if screen.height < 800 {
                                    self.bottomState.height += -screen.height / 1.3
                                } else {
                                    self.bottomState.height += -screen.height / 1.35
                                }
                            }
                        })
                        .onEnded({ value in
                            if (self.bottomState.height > -240) {
                                withAnimation {
                                    self.showArtifacts = false
                                }
                            }
                            if (self.bottomState.height < -325) {
                                
                                if screen.height < 800 {
                                    self.bottomState.height = -screen.height / 1.3
                                } else {
                                    self.bottomState.height = -screen.height / 1.35
                                }
                                
                                //self.bottomState.height = -screen.height / 1.35
                                withAnimation {
                                    self.showArtifacts = true
                                }
                            } else {
                                self.bottomState = .zero
                                withAnimation {
                                    self.showArtifacts = false
                                }
                            }
                        })
                )
            
        }
        // Home button
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(toggle: .constant(false)).environmentObject(UserData())
    }
}
