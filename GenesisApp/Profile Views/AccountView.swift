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
            VStack {
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
                    .padding(.vertical,8)
                
                // Weekly Expenses
                WeeklyBudgetView()
                    .shadow(color: .gray, radius: 4, x: 2, y: 2)
                
                // Starred Artifacts from underneath
                
                Spacer()
                
            }
            .offset(x:0, y: -75)
            .navigationBarItems(trailing:

                Button(action: {
                    withAnimation {
                        self.toggle = false
                    }
                },
                       label: {
                        Image(systemName: "house")
                            .font(.system(size: 20, weight: .light))
                            .padding()
                            .foregroundColor(.black)
                })

            )
//            Text("\(bottomState.height)").offset(y: -300)
            
            // Artifacts?
            StarredArtifactsView(showArtifacts: self.$showArtifacts, bottomState: self.$bottomState)
                .offset(x:0, y: screen.height * 0.75)
                .offset(y: bottomState.height)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.4))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.bottomState = value.translation
                            if self.showArtifacts {
                                self.bottomState.height += -605
                            }
                            if self.bottomState.height < -625 {
                                self.bottomState.height = -615
                            }
                        })
                        .onEnded({ value in
                            if (self.bottomState.height > -240) {
                                withAnimation {
                                    self.showArtifacts = false
                                }
                            }
                            if (self.bottomState.height < -375) {
                                self.bottomState.height = -605
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
        NavigationView{
        AccountView(toggle: .constant(false)).environmentObject(UserData())
    }
    }
}
