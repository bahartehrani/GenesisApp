//
//  InfoSubview2.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/21/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct InfoSubview1: View {
    @EnvironmentObject var userInfo : UserData
    
    @Binding var toggle : Bool
    @State var toggleInfo = false
    
    var body: some View {
           ZStack {
            
                NavigationLink(destination: InfoView(toggle: self.$toggle)
                    .navigationBarBackButtonHidden(true)
                    .statusBar(hidden: true)
                    ,isActive: self.$toggleInfo){
                        EmptyView()
                }.isDetailLink(false)
            
                Image("TutorialHome")
                .resizable()
                .frame(width: screen.width)

                Image("TutorialPointer1")
                .offset(x: 90, y: 150)
            
            VStack(alignment: .leading, spacing: 10.0) {
                    Text("Hey, " + self.userInfo.firstName + "!")
                        .font(Font.custom("Lato-Bold", size: 30))
                
                    Text("Would you like a quick tour?")
                        .font(Font.custom("Lato-Regular", size: 20))
                    
                    HStack {
                        Button(action: {
                            self.toggleInfo = true
                        }) {
                        Text("YES, PLEASE")
                            .font(Font.custom("Lato-Bold", size: 16))
                            .foregroundColor(.white)
                            .padding(.vertical, 14.5)
                            .frame(width: 160)
                            .background(Color.primaryBlue)
                            .cornerRadius(24)
                            .shadow(color: Color(.gray).opacity(0.6), radius: 4, x: 2, y: 2)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            self.toggleInfo = false
                            self.toggle = false
                        }) {
                        Text("NO, THANKS")
                            .font(Font.custom("Lato-Bold", size: 18))
                            .foregroundColor(.primaryBlue)
                            .padding(.vertical, 12)
                            .frame(width: 160)
                            .background(Color.white)
                            .cornerRadius(24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.primaryBlue, lineWidth: 4)
                            )
                            .shadow(color: Color(.gray).opacity(0.3), radius: 3, x: 2, y: 2)
                        }
                    
                    }
                    .padding(.top, 30)
                }
                .padding(30)
                .frame(width: screen.width, height: 300, alignment: .top)
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
                .offset(x: 0, y: screen.height / 2.5)
            }
            .statusBar(hidden: true)
            .edgesIgnoringSafeArea(.all)
    }
}

struct InfoSubview2_Previews: PreviewProvider {
    static var previews: some View {
        InfoSubview1(toggle: .constant(true))
    }
}
