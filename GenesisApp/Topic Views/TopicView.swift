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
    @State private var currentPage = 0
    @State var subtopicNames = ["Loans", "Credit", "Debit"]
    @State var subtopicList = [subTopicData1,subTopicData2, subTopicData3]
//    @State var subtopic2 = subTopicData2
    @State var subtopic3 = subTopicData3
    
    @State var toggleArticle = false
    
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
//
                subtopicSelectors(valueFromParent: self.$currentPage, subtopicName: self.subtopicNames)
                
                PagerView(pageCount: self.subtopicNames.count, currentIndex: self.$currentPage) {
                    ForEach(0..<self.subtopicNames.count) {index in
//                        subtopicMainView(subtopic: self.subtopicList[index])
                        subtopicMainView(subtopic: self.subtopic3)
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

struct subtopicSelectors : View {
    
    @Binding var valueFromParent : Int
    @State var subtopicName : [String]
    
    var body : some View {
        ScrollView (.horizontal) {
            HStack(spacing: 50) {
                
                ForEach(0..<self.subtopicName.count) { index in
                    
                    Button(action: {
                        self.valueFromParent = index
                    }) {
                        Text(self.subtopicName[index])
                            .foregroundColor(self.valueFromParent == index ? .black : .secondaryText)
                    }
                }
                
            }
            .frame(width: screen.width)
            .font(.custom("Lato-Black", size: 24))
        }
        .padding(.top, 24)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
        .offset(x: 0, y: -30)
    }
    
}

struct subtopicMainView : View {
    
    @State var subtopic : [SubTopic]
    @ObservedObject var savings = ArticleStore()
    
    var body : some View {
        ScrollView {
            ForEach(savings.longTerm) { article in
                NavigationLink(destination: ArticleView(
                    toggle: .constant(false),
                    toggleStar: false,
                    name: article.articleName,
                    date: article.dateCreated,
                    author: article.author,
                    topic: article.maintopic)) {
                        
                    SubTopicView(
                        type: article.type, title: article.articleName
                    )
                }
                .foregroundColor(.black)

            }
            
        }
    }
    
}




struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TopicView(mainTopic: "Spending", toggle: .constant(true))
        }
        
//        TopicView(mainTopic: "Spending", toggle: .constant(true))
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

