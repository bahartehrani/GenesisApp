//
//  WeeklyBudgetView.swift
//  GenesisApp
//
//  Created by Productivity on 7/15/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct WeeklyBudgetView: View {
    @State var toggleAdd = false
    @State var showFull = true
    
//    @EnvironmentObject var userInfo : UserData
//    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        ZStack {
            
            WeeklyExpensesView(toggleAdd: $toggleAdd, showFull: $showFull)
            .offset(x: toggleAdd ? 700 : 0, y: 0)
            .animation(.spring(response: 0.7))
            
            AddExpenseView(toggleAdd: $toggleAdd)
                .offset(x: toggleAdd ? 0 : -700, y: 0)
                .animation(.spring(response: 0.7))  
        
            
        }
    }
}

struct WeeklyBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyBudgetView(toggleAdd: false)
    }
}

struct WeeklyExpensesView: View {
    @Binding var toggleAdd: Bool
    @Binding var showFull: Bool
    
    var body: some View {
        VStack {
            
            HStack {
                
                Text("Weekly Expenses")
                    .font(Font.custom("Lato-Black", size: 24))
                    .foregroundColor(.white)
                    .onTapGesture {
                        self.showFull.toggle()
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        //
                    }) {
                        Image("Backward arrow small")
                            .foregroundColor(.white)
                    }.padding(.trailing,3)
                    
                    Button(action: {
                        //
                    }) {
                        Image("Backward arrow small")
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(180))
                    }.padding(.leading,3)
                    
                    Button(action: {
                        self.toggleAdd = true
                    }) {
                        Image(systemName: "plus")
                            //                    OR these:
                            //                       Image(systemName: "plus.square")
                            //                       Image(systemName: "plus.circle")
                            .foregroundColor(.white)
                            .font(Font.custom("Lato-Black", size: 26))
                    }
                    .padding(.leading,6 )
                }
                .padding(.horizontal, 6)
                
            }
            .padding(.horizontal,6)
            
            GeometryReader { geometry in
                //ScrollView (.vertical) {
                    
                    VStack {
                        
                        // Graph - the hard part
                        Rectangle()
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        HStack {
                            
                            VStack {
                                
                                Text("$63")
                                    .font(Font.custom("Lato-Black", size: 30))
                                    .foregroundColor(.white)
                                
                                Text("spent")
                                    .font(Font.custom("Lato-Black", size: 18))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            VStack {
                                
                                Text("$37")
                                    .font(Font.custom("Lato-Black", size: 30))
                                    .foregroundColor(.white)
                                
                                Text("left")
                                    .font(Font.custom("Lato-Black", size: 18))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            VStack {
                                
                                Text("$100")
                                    .font(Font.custom("Lato-Black", size: 30))
                                    .foregroundColor(.white)
                                
                                Text("weekly")
                                    .font(Font.custom("Lato-Black", size: 18))
                                    .foregroundColor(.white)
                            }
                            
                            
                        }.padding(.top,6)
                        
                    }.frame(height: geometry.size.height)
                    
                //}
                .padding(.horizontal,6)
            }
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: screen.height / 5 * 2)
        .padding()
        .background(Color.primaryBlue)
        .cornerRadius(21)
        .padding(.horizontal)
        .shadow(radius: 2)
    }
}
