//
//  WeeklyTipView.swift
//  GenesisApp
//
//  Created by Productivity on 7/15/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct WeeklyTipView: View {
    @State var toggleTip = false
    
    var body: some View {
        
        ZStack {
            oldTipView(toggleTip: self.$toggleTip)
                .offset(x: toggleTip ? 0 : -700, y: 0)
                .animation(.spring(response: 0.7))
            
            currentTipView(toggleTip: self.$toggleTip)
                .offset(x: toggleTip ? 700 : 0, y: 0)
                .animation(.spring(response: 0.7))
        }
    
    }
}

struct WeeklyTipView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyTipView()
    }
}

struct currentTipView: View {
    @Binding var toggleTip : Bool
    
    var body: some View {
        VStack {
            
            HStack {
                
                Text("Weekly Tip")
                    .font(Font.custom("Lato-Black", size: screen.height > 850 ? 30 : 24))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        self.toggleTip.toggle()
                    }) {
                        Image("Backward arrow small")
                            .foregroundColor(Color(#colorLiteral(red: 0.9614372849, green: 0.9614372849, blue: 0.9614372849, alpha: 1)))
                    }
                    
                    Text("Last Week")
                        .font(Font.custom("Lato-Black", size: 18))
                        .foregroundColor(Color(#colorLiteral(red: 0.9614372849, green: 0.9614372849, blue: 0.9614372849, alpha: 1)))
                }
                
            }.padding(.horizontal,6)
            
            ScrollView (showsIndicators: false) {
                
                Text("Did you know it’s almost 5 times more expensive to order from a restaurant than it is to cook at home? We love eating out too, but staying in is sure to result in tastier savings.")
                    .font(Font.custom("Lato-Regular", size:
                        screen.height > 850 ? 20 :
                        screen.height < 800 ? 16 : 18))
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal,4)
            .padding(.top,-6)
            .animation(nil)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: screen.height / 5)
        .padding()
        .background(Color.primaryGreen)
        .cornerRadius(21)
        .padding(.horizontal)
        .shadow(radius: 2)
    }
}


struct oldTipView: View {
    @Binding var toggleTip : Bool
    
    var body: some View {
        VStack {
            
            HStack {
                
                Text("Weekly Tip")
                    .font(Font.custom("Lato-Black", size: screen.height > 850 ? 30 : 24))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack {
                    Text("This Week")
                        .font(Font.custom("Lato-Black", size: 18))
                        .foregroundColor(Color(#colorLiteral(red: 0.9614372849, green: 0.9614372849, blue: 0.9614372849, alpha: 1)))
                    
                    Button(action: {
                        self.toggleTip.toggle()
                    }) {
                        Image("Backward arrow small")
                            .foregroundColor(Color(#colorLiteral(red: 0.9614372849, green: 0.9614372849, blue: 0.9614372849, alpha: 1)))
                            .rotationEffect(.degrees(180))
                    }
                }
                
            }.padding(.horizontal,6)
            
            ScrollView (showsIndicators: false) {
                
                Text("#OLDNEWS Did you know giraffes can run as fast as 35 miles an hour over short distances, or cruise at 10 mph over longer distances and their necks are too short to reach the ground 🧐.")
                    .font(Font.custom("Lato-Regular", size:
                        screen.height > 850 ? 20 :
                            screen.height < 800 ? 16 : 18))
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal,4)
            .padding(.top,-6)
            .animation(nil)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: screen.height / 5)
        .padding()
        .background(Color.primaryGreen)
        .cornerRadius(21)
        .padding(.horizontal)
        .shadow(radius: 2)
    }
}
