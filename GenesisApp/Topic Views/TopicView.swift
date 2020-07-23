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
    @State var backgroundColor : String
    @Binding var toggle : Bool
    @State private var currentPage = 0
    
    @State var subtopicnames : [String] = []
//    @State var description = ""
    
    @EnvironmentObject var topicArticles : ArticleStore
    
    @State var subtopicNames = []
    @State var subtopic3 = subTopicData3
    
    @State var toggleArticle = false
    
    func tester1() {
           print("Starting build topicview")
       }
    
    var body: some View {
        PleaseWaitView(isShowing: .constant(topicArticles.maintopicview.subtopics.count == 0)) {
            VStack {
    //            Top section
                VStack {
                    HStack {
                        Text(self.mainTopic)
                            .font(.custom("Lato-Bold", size: 30))
                            .padding(.vertical, 20)
                        
                        Spacer()
                        
                    }
                    
                    //Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.")
                    Text(self.topicArticles.maintopicview.description.count == 0 ? "\n\n\n" : self.topicArticles.maintopicview.description)
                    
                }
                .padding(32)
                .frame(maxHeight: 350)
                .background(Color(self.backgroundColor))
                
                
    //            article selections
                VStack {
    //
                    subtopicSelectors(valueFromParent: self.$currentPage, subtopicName: self.$topicArticles.maintopicview.subtopics)
                    
                    PagerView(pageCount: self.topicArticles.maintopicview.subtopics.count, currentIndex: self.$currentPage) {
                        ForEach(0..<self.topicArticles.maintopicview.subtopics.count, id: \.self) {index in
    //                        subtopicMainView(subtopic: self.subtopicList[index])
                            subtopicMainView(subtopic: (self.topicArticles.maintopicview.subtopicArtifacts[self.topicArticles.maintopicview.subtopics[index]] ?? self.subtopic3))
                        }
                    }
                    
     
                }
                .frame(height: screen.height * 3/5)
                
            }
    //        .onAppear(perform: {
    //            self.topicArticles.fetchMainTopic(maintopic: "spending")
    //        }
    //        )
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
            .onAppear(perform: self.tester1)
            .edgesIgnoringSafeArea(.all)
//                .animation(.easeOut(duration: 0.5))
//                .animation(.easeInOut(duration: 0.5))
            .animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
        }
    }
}

struct subtopicSelectors : View {
    
    @Binding var valueFromParent : Int
    @Binding var subtopicName : [String]
    
    var body : some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack(spacing: 50) {
                
                ForEach(0..<self.subtopicName.count, id: \.self) { index in
                    
                    Button(action: {
                        self.valueFromParent = index
                        print(self.subtopicName)
                    }) {
                        Text(self.subtopicName[index])
                            .foregroundColor(self.valueFromParent == index ? .black : .secondaryText)
                    }
                }
                
            }
            .font(.custom("Lato-Black", size: 24))
        }
        .padding(.top, 24)
        .padding(.horizontal, 24)
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
        .frame(maxWidth: .infinity)
        .offset(x: 0, y: -40)
        .onAppear(
            perform: {
                print(self.subtopicName.count)
        })
    }
    
}

struct subtopicMainView : View {

    @State var subtopic : [SubTopic]
    
    func tester() {
        print("test test test")
        print(subtopic)
    }
    
    var body : some View {
        ScrollView {
            ForEach(subtopic) { article in
                
//                NavigationLink(destination: ArticleView(
//                    toggle: .constant(false),
//                    toggleStar: false,
//                    name: article.title,
//                    date: article.dateCreated,
//                    author: article.author,
//                    topic: article.maintopic))
                NavigationLink(destination: AccountView(toggle: .constant(false)))
                {
                    SubTopicView(
                        type: article.type, title: article.title
                    )
                }
                .foregroundColor(.black)

            }
            
        }
        .offset(x: 0, y: -30)
        .onAppear(perform: self.tester)

    }
    
}




struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TopicView(mainTopic: "Spending", backgroundColor: "secondaryGold", toggle: .constant(true))
        }
    }
}

struct SubTopicView: View {
    var type : String
    var title: String
    
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

