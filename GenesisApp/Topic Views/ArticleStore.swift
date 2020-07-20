//
//  ArticleStore.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/20/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI
//import Combine
//import FirebaseCore
import FirebaseFirestore
//import FirebaseFirestoreSwift

class ArticleStore : ObservableObject {
    
    var longTerm: [Article] = [
        Article(articleBody: "abc", articleName: "def", author: "ghi", dateCreated: "jkl", maintopic: "mno", subtopic: "por", type: "stu"),
        Article(articleBody: "fs", articleName: "awe", author: "cxvc", dateCreated: "vcxvcx", maintopic: "vcx", subtopic: "vcxv", type: "vui")]
    
    var articlesCollectionRef : CollectionReference
    var db: Firestore!
    
    init() {
        
        articlesCollectionRef = Firestore.firestore().collection("articles")
        longTermArticles()
//        db = Firestore.firestore()
    }

    func longTermArticles() {
        
//        articlesCollectionRef.whereField("subtopic", isEqualTo: "long-term").getDocuments
//        let articlesCollectionRef = db.collection("articles")
        
        
        //First testing if the right data is called
        articlesCollectionRef.getDocuments(completion: { (snapshot, error) in
            if let err = error {
                debugPrint("Error in fetching docs: \(err)")
            } else {
                guard let snap = snapshot else { return }
                for document in snap.documents {
                    let data = document.data()
                    let articleBody = data["articleBody"] as? String ?? "Word...s..."
                    let articleName = data["articleName"] as? String ?? "Title"
                    let author = data["author"] as? String ?? "Author"
                    let dateCreated = data["dateCreated"] as? String ?? "Today"
                    let maintopic = data["maintopic"] as? String ?? "Topic"
                    let subtopic = data["subtopic"] as? String ?? "Subtopics"
                    let type = data["type"] as? String ?? "Type"
//                    let documentId = document.documentID
                    
                    let newArticle = Article(articleBody: articleBody, articleName: articleName, author: author, dateCreated: dateCreated, maintopic: maintopic, subtopic: subtopic, type: type)
                    
                    self.longTerm.append(newArticle)
                    
                    print("\(document.documentID) => \(document.data())")
            
                }
            }
        })
    }
}
