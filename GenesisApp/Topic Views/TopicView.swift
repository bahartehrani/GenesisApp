//
//  TopicView.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/14/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI
import Firebase

struct TopicView: View {
    @State var mainTopic : String
    @State var backgroundColor : String
    @Binding var toggle : Bool
    @State var toggleView = false
    @State private var currentPage = 0
    
    @State var subtopicnames : [String] = []
//    @State var description = ""
    
    @EnvironmentObject var userInfo : UserData
    @EnvironmentObject var topicArticles : ArticleStore
    @Binding var maintopicview : MainTopicOverview
    
    @State var subtopicNames = []
    @State var subtopic3 = subTopicData3
    
    @State var toggleArticle = false
    
    func tester1() {
           print("Starting build topicview")
       }
    
    var body: some View {
        PleaseWaitView(isShowing: .constant(
//            mainTopic == "Spending" ?
//                self.topicArticles.maintopicviewSpending.subtopicArtifacts.count == 0
//            : mainTopic == "Savings" ?
//                self.topicArticles.maintopicviewSavings.subtopicArtifacts.count == 0
//            : self.topicArticles.maintopicview.subtopicArtifacts.count == 0
            
            self.maintopicview.subtopicArtifacts.count == 0
            )) {
            VStack {
    //            Top section
                
                NavigationLink(destination: ArticleView(currentArt: self.$topicArticles.currentArticle, toggle: self.$toggleView, toggleArticle: self.$toggle)
                    .environmentObject(self.userInfo)
                    .environmentObject(self.topicArticles)
                        .navigationBarBackButtonHidden(true)
                    , isActive: self.$toggleView)
                {
                    EmptyView()
                }
                
                
                VStack {
                    HStack {
                        Text(self.mainTopic)
                            .font(.custom("Lato-Bold", size: 30))
                            .padding(.vertical, 20)
                        
                        Spacer()
                        
                    }
                    
                    //Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.")
//                    Text(self.topicArticles.maintopicview.description.count == 0 ? "\n\n\n" : self.topicArticles.maintopicview.description)
                    Text(self.maintopicview.description.count == 0 ? "\n\n\n" : self.maintopicview.description)
                    
                }
                .padding(32)
                .frame(maxHeight: 350)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(self.backgroundColor), Color(.primaryGreen)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                    Color(self.backgroundColor)
                )
                
                
    //            article selections
                VStack {
    //
                    subtopicSelectors(valueFromParent: self.$currentPage, subtopicName: //self.$topicArticles.maintopicview.subtopics)
                        self.$maintopicview.subtopics)
                    
                    PagerView(pageCount: self.maintopicview.subtopics.count, currentIndex: self.$currentPage) {
                            ForEach(0..<self.maintopicview.subtopics.count, id: \.self) {index in
                                subtopicMainView(toggleView: self.$toggleView, maintopicStore: self.mainTopic, subtopicStore: self.maintopicview.subtopics[index],
                                    subtopic: (self.maintopicview.subtopicArtifacts[self.maintopicview.subtopics[index]] ?? self.subtopic3))
                                    .environmentObject(self.userInfo)
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
                //.animation(.default)
//                .animation(.easeOut(duration: 0.5))
//                .animation(.easeInOut(duration: 0.5))
            //.animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
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
    
    @Binding var toggleView : Bool
    @State var maintopicStore : String
    @State var subtopicStore : String
    @State var subtopic : [SubTopic]
    @EnvironmentObject var userInfo : UserData
    @EnvironmentObject var topicArticles : ArticleStore
    
    func tester() {
        print("test test test")
        print(subtopic)
    }
    
    var body : some View {
        ScrollView(showsIndicators: false) {
            ForEach(subtopic) { article in
                
//                NavigationLink(destination: ArticleView(
//                    toggle: .constant(false),
//                    toggleStar: false,
//                    name: article.title,
//                    date: article.dateCreated,
//                    author: article.author,
//                    topic: article.maintopic))

                    
                SubTopicView(
                    type: article.type, title: article.title
                )
                    .onTapGesture {
                        if self.userInfo.recentContentMod.count > 4 {
                            self.userInfo.recentContentMod.remove(at: 0)
                        }
                        if !self.userInfo.recentContentMod.contains(recentlyViewed(maintopic: self.maintopicStore, title: article.title)) {
                            
                            self.userInfo.recentContentMod.append(recentlyViewed(maintopic: self.maintopicStore, title: article.title))
                        }
                        
                        if self.userInfo.recentContent?.count ?? 0 > 4 {
                            self.userInfo.recentContent?.remove(at: 0)
                        }
                        if !(self.userInfo.recentContent?.contains(self.maintopicStore + "," + article.title) ?? true) {
                            
                            self.userInfo.recentContent?.append(self.maintopicStore + "," + article.title)
                        }
                        
                        
                        Firestore.firestore().collection("users").document(self.userInfo.uid).setData([
                            "recentContent" : self.userInfo.recentContent ?? []
                        ],merge:true)
                        
                        self.topicArticles.fetchArticle(givenmaintopic: self.maintopicStore, title: article.title) { arti in
                            self.toggleView.toggle()
                            print(arti)
                        }
                    }
                .foregroundColor(.black)

            }
            
        }
        .offset(x: 0, y: -20)
        .onAppear(perform: self.tester)

    }
    
}




//struct TopicView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            TopicView(mainTopic: "Spending", backgroundColor: "secondaryGold", toggle: .constant(true), maintopicview: )
//        }
//    }
//}

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

