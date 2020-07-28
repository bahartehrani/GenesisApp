//
//  SearchItems.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/27/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct SearchItems: View {
    @Binding var searchQuery : String
    
    //will replace w subtopicarticles from database later
    //this is tester: TYPE IN SEARCH "Apples" huehue ;)
    @State var searchTopics: [String] = []
    @State var searchTest =
    [Article(articleBody: "Apples and bananas and stuff to look for", articleName: "Article 1", author: "c", dateCreated: "d", maintopic: "Eats", subtopic: "f", type: "Im"),
    Article(articleBody: "helps and stuff Apples", articleName: "Article 2", author: "j", dateCreated: "k", maintopic: "Pie", subtopic: "m", type: "Pretty"),
    Article(articleBody: "Apples and stuff", articleName: "Article 3", author: "c", dateCreated: "d", maintopic: "Eats", subtopic: "f", type: "Hungers"),
    Article(articleBody: "Apples and look for", articleName: "Article 4", author: "c", dateCreated: "d", maintopic: "Eats", subtopic: "f", type: "WBU")]
    
    func addTopic(maintopic : String){
        searchTopics.append(maintopic)
    }
    
    var body: some View {

        VStack {
            HStack{
                Text("Related Topics")
                .font(Font.custom("Lato-Bold", size: 25))
                Spacer()
            }
            .padding(.horizontal, 24)
            
            ScrollView (.horizontal, showsIndicators: false){
            HStack{
                ForEach(self.searchTopics, id: \.self) { topic in
                    VStack (alignment: .leading){
                        MainTopicCardView(mainTopic: topic, primaryColor: .primaryGreen, topicImage: "Home - Investing Illustration" , toggle: .constant(false))
                            .offset(x: 0, y: 0)
//                        Text(article.articleName)
//                        .font(Font.custom("Lato-Bold", size: 20))
                    }
                    .padding(.horizontal, 8)
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
            }
                
            HStack {
                Text("Artifacts")
                .font(Font.custom("Lato-Bold", size: 25))
                Spacer()
            }
            .padding(.horizontal, 24)
            
            ForEach (searchTest.filter({ $0.articleBody.contains(searchQuery) })) { article in
                HStack {
                    VStack (alignment: .leading){
                        Text(article.type.uppercased())
                        .font(Font.custom("Lato-Bold", size: 16))
                        Text(article.articleName)
                        .font(Font.custom("Lato-Regular", size: 20))
                    }
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.custom("Lato-Regular", size: 25))
                }
                .padding(.bottom, 8)
                .padding(.horizontal, 24)
                .onAppear {
                    if !(self.searchTopics.contains(article.maintopic)){
                        self.addTopic(maintopic: article.maintopic)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            
            Text("End of Search Results")
            .font(Font.custom("Lato-Bold", size: 16))
            .foregroundColor(Color(#colorLiteral(red: 0.5019607843, green: 0.5058823529, blue: 0.5176470588, alpha: 1)))
            .padding(32)
            
        }
    }
}

struct SearchItems_Previews: PreviewProvider {
    static var previews: some View {
        SearchItems(searchQuery: .constant(""))
    }
}


