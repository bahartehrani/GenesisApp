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
    @Binding var toggleSearch : Bool
    
    //will replace w subtopicarticles from database later
    //this is tester: TYPE IN SEARCH "Apples" huehue ;)
    @State var searchTopics: [String] = []
    @State var searchTest =
    [Article(articleBody: "Apples and bananas and stuff to look for", articleName: "Apples and bananas eats", author: "c", dateCreated: "d", maintopic: "eats", subtopic: "f", type: "Im"),
    Article(articleBody: "helps and stuff Apples", articleName: "stuff Apples", author: "j", dateCreated: "k", maintopic: "pie", subtopic: "m", type: "Pretty"),
    Article(articleBody: "Apples and stuff", articleName: "Apples and stuff eats", author: "c", dateCreated: "d", maintopic: "eats", subtopic: "f", type: "Hungers"),
    Article(articleBody: "Apples and look for", articleName: "Apples and look", author: "c", dateCreated: "d", maintopic: "eats", subtopic: "f", type: "WBU")]
    
    func addTopic(maintopic : String){
        searchTopics.append(maintopic)
    }
    
    var body: some View {

        ScrollView (showsIndicators: false){
            VStack {
                HStack {
                    Button(action: {
                        self.toggleSearch = false
                        self.searchQuery = ""
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                            .font(Font.custom("Lato-Regular", size: 20))
                        
                    }
//                    .padding(.trailing, 10)
                    .frame(width: 20, height: 20)
                    
                    SearchBar(text: $searchQuery, toggleSearch: $toggleSearch)
                }
                .padding(.trailing, 10)
                .padding(.horizontal, 28)
                
                HStack{
                    Text("Related Topics")
                    .font(Font.custom("Lato-Bold", size: 25))
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.horizontal, 28)
                
                ScrollView (.horizontal, showsIndicators: false){
                HStack{
                    ForEach(self.searchTopics, id: \.self) { topic in
                        ZStack (alignment: .leading){
                            Text("")
                            .frame(width: (UIScreen.main.bounds.width - 56)/2, height: (UIScreen.main.bounds.width - 56)/2)
                                .background(Color(.gray).opacity(0.7))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .offset(x: 1, y: 2)
                            
                            MainTopicCardView(mainTopic: topic, primaryColor: .primaryGreen, topicImage: "Home - Investing Illustration" , toggle: .constant(false))
                                .offset(x: 0, y: 0)
    //                        Text(article.articleName)
    //                        .font(Font.custom("Lato-Bold", size: 20))
                            
                            Text("")
                            .frame(width: (UIScreen.main.bounds.width - 56)/2, height: (UIScreen.main.bounds.width - 56)/2)
                                .background(Color(.white).opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                .offset(x: 1, y: 1)
                        }
                        .padding(.horizontal, 10)
                    }
                }
                .padding(.horizontal, 18)
                .padding(.bottom, 16)
                }
                    
                HStack {
                    Text("Artifacts")
                    .font(Font.custom("Lato-Bold", size: 25))
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.horizontal, 28)
                
                ForEach (searchTest.filter({ $0.articleName.contains(searchQuery) || $0.maintopic.contains(searchQuery)}))
                { article in
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
                    .padding(.horizontal, 28)
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
                .padding(.top, 40)
                
                Spacer()
            }
            .padding(.vertical, 20)
        }
    }
}

struct SearchItems_Previews: PreviewProvider {
    static var previews: some View {
        SearchItems(searchQuery: .constant(""), toggleSearch: .constant(true))
    }
}


