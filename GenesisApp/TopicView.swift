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
    @Binding var toggle : Bool
    @State var showLoans = true
    @State var showCredit = false
    @State var showDebt = false
    @State var subtopic1 = subTopicData1
    @State var subtopic2 = subTopicData2
    @State var subtopic3 = subTopicData3
    
    var body: some View {
        VStack {
//            Top section
            VStack {
                HStack {
                    Text(mainTopic)
                        .font(.custom("Lato-Bold", size: 30))
                        .padding(.vertical, 20)
                    
                    Spacer()
                    
                }
                
                Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.")
                
            }
            .padding(32)
            .frame(maxHeight: 350)
            .background(Color.secondaryGold)
            
//            article selections
            VStack {
                ScrollView (.horizontal) {
                    HStack(spacing: 50) {
                        Button(action: {
                            self.showLoans = true;
                            self.showCredit = false;
                            self.showDebt = false;
                        }) {
                        Text("Loans")
                        }
//                        .padding(.leading)
                        Button(action: {
                            self.showLoans = false;
                            self.showCredit = true;
                            self.showDebt = false;
                        }) {
                        Text("Credit")
                        }
                        Button(action: {
                            self.showLoans = false;
                            self.showCredit = false;
                            self.showDebt = true;
                        }) {
                        Text("Debt")
                        }
                    }
                    .frame(width: screen.width)
                    .font(.custom("Lato-Black", size: 24))
                }
                .padding(.top, 24)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
                .offset(x: 0, y: -30)
                
                
                if showLoans{
                    ScrollView {
                        ForEach(subtopic1.indices, id: \.self) { index in
                            SubTopicView(type: self.subtopic1[index].type, title: self.subtopic1[index].title
                            )
                        }
                    }
                }
                
                if showCredit{
                    ScrollView {
                        ForEach(subtopic2.indices, id: \.self) { index in
                            SubTopicView(type: self.subtopic2[index].type, title: self.subtopic2[index].title
                            )
                        }
                    }
                }
                
                if showDebt{
                    ScrollView {
                        ForEach(subtopic3.indices, id: \.self) { index in
                            SubTopicView(type: self.subtopic3[index].type, title: self.subtopic3[index].title
                            )
                        }
                    }
                }
            }
                //different phones have diff sizes :o ; not sure how to fix; maybe a new view open up the details + a pic?
            .frame(height: screen.height * 3/5)
            
        }
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
        .edgesIgnoringSafeArea(.all)
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView(mainTopic: "Spending", toggle: .constant(true))
    }
}

struct SubTopicView: View {
    var type : String
    var title: String
    // Name of article var
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .font(.system(size: 40, weight: .light))
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(type.uppercased())
                    .font(.custom("Lato-Black", size: 16))
                Text(title)
                    .font(.custom("Lato-Regular", size: 20))
            }
            Spacer()
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
    }
}


struct SubTopic : Identifiable {
    var id = UUID()
    var type: String
    var title: String
}

let subTopicData1 = [
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
]

let subTopicData2 = [
    SubTopic(type: "Game", title: "bbbbbbbbb"),
    SubTopic(type: "Game", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Game", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Game", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Game", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Game", title: "AAAAAAAAAAAAAAA"),
]

let subTopicData3 = [
    SubTopic(type: "Article", title: "ccccccccc"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
    SubTopic(type: "Article", title: "AAAAAAAAAAAAAAA"),
]

