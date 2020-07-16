//
//  ArticleView.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/16/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    @Binding var toggle : Bool
    @State var toggleStar : Bool
    
    var body: some View {
        
        VStack {
            HStack{
                Text("Spending")
                    .padding(.top, 30)
                
                Spacer()
            }
            .font(.custom("Lato-Bold", size: 30))
            .padding(.horizontal, 32)
            .frame(width: screen.width, height: 220)
            .background(Color.secondaryGold)
            .offset(x: 0, y: -40)
            
            HStack {
                Text("Different Types of Loans ")
                
                Spacer()
                
                Image(systemName: toggleStar ? "star.fill" : "star")
                    .onTapGesture {
                        self.toggleStar.toggle()
                }
                
            }
            .font(.custom("Lato-Black", size: 24))
            .padding(32)
            .padding(.vertical, 8)
            .frame(width: screen.width)
            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
            .offset(x: 0, y: -120)
            
            ScrollView {
                Text("Infoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content infoInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content info  \n\nInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content infoInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content info\n\n\nInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content infoInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content info\n\nInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content infoInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content info\n\n\nInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content infoInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content info\n\nInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content infoInfoinfo info more info on loand and wow we are learning good one beep boop learning info info fino content info\n\nInfoinfo info more info on loand and wow we are learning good one beep boop ")
                    .font(.custom("Lato-Regular", size: 18))
                    .padding(.horizontal, 32)
                    .frame(width: screen.width)
            }
            .offset(x: 0, y: -150)
            .frame(height: screen.height - 350)
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "chevron.left")
                Text("Introduction to Loans")
                }
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Which Loan Fits?")
                Image(systemName: "chevron.right")
                }
            }
            .font(.custom("Lato-Regular", size: 12))
            .foregroundColor(.black)
            .padding(.horizontal, 32)
            .offset(x: 0, y: -120)
            
                
            Spacer()
                
            .navigationBarItems(trailing:

                Button(action: {
                    withAnimation {
                        self.toggle = false
                    }
                }, label: {
                    Image(systemName: "house")
                    .font(.system(size: 20, weight: .light))
                    .padding()
                    .foregroundColor(.black)
                })

            )
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        ArticleView(toggle: .constant(false), toggleStar: false)
        }
    }
}
