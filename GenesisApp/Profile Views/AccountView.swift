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
    
    @Binding var toggle : Bool
    
    @State var showArtifacts = false
    @State var bottomState = CGSize.zero
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                VStack(alignment: .center) {
                    // Name
                    HStack {
                        Text("Daisy Zhang")
                        .font(Font.custom("Lato-Bold", size: 32))
                        
                        Spacer()
                    }
                    .padding(.horizontal,20)
                    .padding(.top,8)
                    
                    // Edit Account
                    
                    HStack {
                        
                        Button(action: {
                            //
                        }, label: {
                            Text(self.showArtifacts ? " " : "Edit Account")
                            .font(Font.custom("Lato-Regular", size: 18))
                            .foregroundColor(.secondaryText)
                        })
                        
                        Spacer()
                    }
                    .padding(.vertical,6)
                    .padding(.horizontal,20)
                    
                    
                    // Weekly Tip
                    WeeklyTipView()
                        .padding(.bottom,8)
                    
                    // Weekly Expenses
                    WeeklyBudgetView()
                        .padding(.bottom, screen.height / 4)
                    
                    // Starred Artifacts from underneath
                    
                    //Spacer()
                    
                }
                //.edgesIgnoringSafeArea(.all)
                    //frame(maxHeight: geometry.size.height)
                    .frame(height: geometry.size.height)
                .offset(x:0, y: (geometry.size.height * 0.006))
                .navigationBarItems(trailing:

                    Button(action: {
                        withAnimation {
                            self.toggle = false
                        }
                    },
                           label: {
                            Image(systemName: "house")
                                .font(.system(size: 20, weight: .light))
                                .padding([.horizontal,.bottom])
                                .foregroundColor(.black)
                    })

                )
            }
            
            // Artifacts?
            StarredArtifactsView(showArtifacts: self.$showArtifacts, bottomState: self.$bottomState)
                .offset(x:0, y: screen.height * 1.065)
                .offset(y: bottomState.height)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.4))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.bottomState = value.translation
                            if self.showArtifacts {
                                self.bottomState.height += -screen.height / 1.35
                            }
                        })
                        .onEnded({ value in
                            if (self.bottomState.height > -240) {
                                withAnimation {
                                    self.showArtifacts = false
                                }
                            }
                            if (self.bottomState.height < -325) {
                                self.bottomState.height = -screen.height / 1.35
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
