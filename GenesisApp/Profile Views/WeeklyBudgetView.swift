//
//  WeeklyBudgetView.swift
//  GenesisApp
//
//  Created by Productivity on 7/15/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct WeeklyBudgetView: View {
    var body: some View {
        VStack {
            
            HStack {
                
                Text("Weekly Expenses")
                    .font(Font.custom("Lato-Black", size: 28))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        //
                    }) {
                        Image("Backward arrow small")
                            .foregroundColor(.secondaryText)
                    }.padding(.trailing,2)
                    
                    Button(action: {
                        //
                    }) {
                        Image("Backward arrow small")
                            .foregroundColor(.secondaryText)
                            .rotationEffect(.degrees(180))
                    }.padding(.leading,2)
                }
                
            }.padding(.horizontal,6)
            
            GeometryReader { geometry in
                ScrollView (.vertical) {
                    
                    VStack {
                        
                        // Graph - the hard part
                        Rectangle()
                            .foregroundColor(.white)
                            
                        Spacer()
                        
                        HStack {
                            
                            VStack {
                                
                                Text("$63")
                                .font(Font.custom("Lato-Black", size: 32))
                                .foregroundColor(.white)
                                
                                Text("spent")
                                .font(Font.custom("Lato-Black", size: 18))
                                .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            VStack {
                                
                                Text("$37")
                                .font(Font.custom("Lato-Black", size: 32))
                                .foregroundColor(.white)
                                
                                Text("left")
                                .font(Font.custom("Lato-Black", size: 18))
                                .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            VStack {
                                
                                Text("$100")
                                .font(Font.custom("Lato-Black", size: 32))
                                .foregroundColor(.white)
                                
                                Text("weekly")
                                .font(Font.custom("Lato-Black", size: 18))
                                .foregroundColor(.white)
                            }
                            
                            
                        }.padding(.top,6)
                        
                    }.frame(height: geometry.size.height)
                    
                }.padding(.horizontal,6)
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

struct WeeklyBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyBudgetView()
    }
}
