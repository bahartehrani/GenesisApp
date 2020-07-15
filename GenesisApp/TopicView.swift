//
//  TopicView.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/14/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct TopicView: View {
    @State var mainTopic : String
    
    var body: some View {
        VStack {
//            Top section
            VStack {
                HStack {
                    Text(mainTopic)
                        .font(.custom("Lato-Bold", size: 30))
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    Image(systemName: "house")
                        .font(.system(size: 20, weight: .light))
                        .padding(.bottom, 20)
                }
                
                Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.")
                
            }
            .padding(32)
            .frame(maxHeight: 350)
            .background(Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
            
//            article selections
            VStack {
                ScrollView (.horizontal) {
                    HStack(spacing: 50.0) {
                        Text("Loans")
                        Text("Credit")
                        Text("Debt")
                    }
                    .font(.custom("Lato-Black", size: 24))
                }
                .padding(.top, 24)
                .padding(.horizontal, 32)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
                .offset(x: 0, y: -40)
                
                ScrollView {
                    VStack {
                        SubTopicView()
                        SubTopicView()
                        SubTopicView()
                        SubTopicView()
                        SubTopicView()
                        SubTopicView()
                        SubTopicView()
                    }
                }
                .offset(x: 0, y: -16)
            }
                //different phones have diff sizes :o ; not sure how to fix; maybe a new view open up the details + a pic?
            .frame(height: screen.height * 3/5)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView(mainTopic: "Spending")
    }
}

struct SubTopicView: View {
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .font(.system(size: 40, weight: .light))
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text("Article".uppercased())
                    .font(.custom("Lato-Black", size: 16))
                Text("Introduction to Loansbnbgjhvhb")
                    .font(.custom("Lato-Regular", size: 20))
            }
            Spacer()
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
    }
}
