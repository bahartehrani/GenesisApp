//
//  ArticleView.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/20/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI
import Firebase

struct ArticleView: View {
    @EnvironmentObject var topicArticles : ArticleStore
    @EnvironmentObject var userInfo : UserData
    @Binding var currentArt : Article
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var toggle : Bool
    @State var toggleStar = false
    @Binding var toggleHome : Bool
//    @State var name : String
//    @State var date : String
//    @State var author : String
//    @State var topic : String
    
    var body: some View {
        
        VStack {
            HStack{
                Text(self.currentArt.maintopic)
                    .padding(.top, screen.height > 850 ? 10 : 5)
                Spacer()
            }
            .font(.custom("Lato-Bold", size: 32))
            .padding(.horizontal, 32)
            .frame(width: screen.width, height: 220)
            .background(Color.secondaryGold)
            .offset(x: 0, y: screen.height > 850 ? -30 : -35)
            
            VStack {
                ScrollView {
                VStack(alignment: .leading, spacing: 4.0) {
                    HStack {
                        Text(self.currentArt.articleName)
                        
                        Spacer()
                        
                        Image(systemName: toggleStar ? "star.fill" : "star")
                            .onTapGesture {
                                self.toggleStar.toggle()
                                
                                if self.toggleStar {
                                    
                                    if !(self.userInfo.starredContent?.contains(self.currentArt.type + "," + self.currentArt.maintopic + "," + self.currentArt.articleName) ?? true) {
                                        self.userInfo.starredContent?.append(self.currentArt.type + "," + self.currentArt.maintopic + "," + self.currentArt.articleName)
                                    }
                                    
                                    if !self.userInfo.starredContentMod.contains(StarredArtifact(type : self.currentArt.type, maintopic:  self.currentArt.maintopic, title: self.currentArt.articleName)) {
                                        
                                        self.userInfo.starredContentMod.append(StarredArtifact(type : self.currentArt.type, maintopic:  self.currentArt.maintopic, title: self.currentArt.articleName))
                                    }
                                    
                                    Firestore.firestore().collection("users").document(self.userInfo.uid).setData([
                                        "starredContent" : self.userInfo.starredContent ?? []
                                    ],merge:true)
                                    
                                } else {
                                    
                                    if let idx = self.userInfo.starredContent?.firstIndex(of: (self.currentArt.type + "," + self.currentArt.maintopic + "," + self.currentArt.articleName)) {
                                        self.userInfo.starredContent?.remove(at: idx)
                                    }
                                    if let idx2 = self.userInfo.starredContentMod.firstIndex(of: StarredArtifact(type : self.currentArt.type, maintopic:  self.currentArt.maintopic, title: self.currentArt.articleName)) {
                                        self.userInfo.starredContentMod.remove(at: idx2)
                                    }
                                    
                                    Firestore.firestore().collection("users").document(self.userInfo.uid).setData([
                                        "starredContent" : self.userInfo.starredContent ?? []
                                    ],merge:true)
                                    
                                }
                                
                                
                        }
                        .padding(.top, 20)
                        
                    }
                    .font(.custom("Lato-Black", size: 24))
                    
                    Text(self.currentArt.author)
                    
                    Text(self.currentArt.dateCreated)
                }
                .font(.custom("Lato-Light", size: 16))
                .padding(.horizontal, 30)
                .frame(width: screen.width)
            
                    Text(self.currentArt.articleBody)
                        .font(.custom("Lato-Regular", size: 18))
                        .padding(.top, 12)
                        .padding(.horizontal, 30)
                        .frame(width: screen.width)
                }
                .padding(.top, 32)
                .frame(height: screen.height - 220)
                
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
    //                .offset(x: 0, y: -120)
            
            }
            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
            .offset(x: 0, y: screen.height > 850 ? -95 : -120)
            
            Spacer()
            .navigationBarItems(
                    leading: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                            self.toggle.toggle()
                    }, label: {
                        Image("Backward arrow small")
                            .font(.system(size: 24))
                            //.foregroundColor(.secondaryText)
                            .foregroundColor(.black)
                            .padding()
                        
                }), trailing:
                Button(action: {
                    withAnimation {
                            self.toggleHome = false
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

//struct ArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            ArticleView(toggle: .constant(false), toggleStar: false, name: "The Name of Article", date: "12-20-2020", author: "Yomama Teehee", topic: "Spending")
//        }
//    }
//}
