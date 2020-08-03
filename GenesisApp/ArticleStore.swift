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
    
    var db = Firestore.firestore()
    var subtopicArticles : [Article] = []
    var currentArticle : Article = Article(articleBody: "", articleName: "", author: "", dateCreated: "", maintopic: "", subtopic: "", type: "")
    
    var weeklyTipThisandLast : [String] = ["thisweek", "lastweek"]
    
    
    // dont need anymore i think, but keepin it for now
    @Published var maintopicview = MainTopicOverview(title: "", subtopics: [], description: "", subtopicArtifacts : [:])
    
    @Published var maintopicviewSpending = MainTopicOverview(title: "spending", subtopics: [], description: "", subtopicArtifacts : [:])
    @Published var maintopicviewSavings = MainTopicOverview(title: "savings", subtopics: [], description: "", subtopicArtifacts : [:])
    @Published var maintopicviewInvesting = MainTopicOverview(title: "investing", subtopics: [], description: "", subtopicArtifacts : [:])
    
    
    func fetchMainTopic (maintopic: String, completion: @escaping (Bool) -> Void) {
        //self.maintopicview.subtopicArtifacts.removeAll()
        // , completion: @escaping (MainTopicOverview) -> Void
        //self.maintopicview = MainTopicOverview(title: "", subtopics: [], description: "", subtopicArtifacts : [:])
        
        db.collection(maintopic).document("maintopicview")
            .getDocument { (doc, error) in
                
                if let err = error {
                    print(err)
                   completion(false)
                } else {
                    let mainTitle = doc?.get("title") as! String
                    let mainDescript = doc?.get("description") as! String
                    let mainSubtopics = doc?.get("subtopics") as! [String]
                    let mainSubtopicPreArtifacts = doc?.get("subtopicArtifacts") as! [String : [String]]
                    
                    var mainSubtopicArtifacts : [String : [SubTopic]] = [:]
                    var SubTopicArr : [SubTopic] = []
                    
                    for (subtopic, subtopArtifacts) in mainSubtopicPreArtifacts {
                        for artifact in subtopArtifacts {
                            let subarr = artifact.components(separatedBy: ",")
                            let subtopic_item = SubTopic(type: subarr[0], title: subarr[1])
                            print(subarr)
                            
                            SubTopicArr.append(subtopic_item)
                        }
                        mainSubtopicArtifacts[subtopic] = SubTopicArr
                        SubTopicArr.removeAll()
                    }
                    
                    print("Artifacts?")
                    print(mainSubtopicArtifacts)
                    
                    if maintopic == "spending" {
                        self.maintopicviewSpending = MainTopicOverview(title: mainTitle, subtopics: mainSubtopics, description: mainDescript, subtopicArtifacts: mainSubtopicArtifacts)
                    }
                    if maintopic == "savings" {
                        self.maintopicviewSavings = MainTopicOverview(title: mainTitle, subtopics: mainSubtopics, description: mainDescript, subtopicArtifacts: mainSubtopicArtifacts)
                    }
                    if maintopic == "investing" {
                        self.maintopicviewInvesting = MainTopicOverview(title: mainTitle, subtopics: mainSubtopics, description: mainDescript, subtopicArtifacts: mainSubtopicArtifacts)
                    }
                    
//                    self.maintopicview = MainTopicOverview(title: mainTitle, subtopics:   mainSubtopics, description: mainDescript, subtopicArtifacts: mainSubtopicArtifacts)
                    
                    print(mainDescript)
                    completion(true)
                    
                }
        }
    }
    
    
    func fetchArticle(givenmaintopic: String, title: String, completion: @escaping (Article) -> Void) {
        db.collection("artifacts").document(givenmaintopic + "," + title).addSnapshotListener {(snapshot, error) in
            if let err = error {
                print("Error fetching: \(err)")
                completion(self.currentArticle)
            } else {
                let data = snapshot!.data()
                let articleBody = data?["articleBody"] as? String ?? "Can't find the words..."
                let articleName = data?["articleName"] as? String ?? "TBD someday 👀"
                let author = data?["author"] as? String ?? "Anonymous"
                let dateCreated = data?["dateCreated"] as? String ?? "Tomorrow"
                let maintopic = data?["maintopic"] as? String ?? "Topic"
                let subtopic = data?["subtopic"] as? String ?? "Subtopics"
                let type = data?["type"] as? String ?? "Type"
                
                let nAr = Article(articleBody: articleBody, articleName: articleName, author: author, dateCreated: dateCreated, maintopic: maintopic, subtopic: subtopic, type: type)
                self.currentArticle = nAr
                completion(nAr)
            }
        }
        
        
    }
    
    
    func fetchArticles(maintopic : String, subtopic : String, completion: @escaping (Bool) -> Void) {
        
        db.collection(maintopic).whereField("subtopic", isEqualTo: subtopic)
            .getDocuments(completion: { (querySnapshot, error) in
            if let err = error {
                print("Error in fetching docs: \(err)")
                completion(false)
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                
                    print("reached?")
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
                    
                    self.subtopicArticles.append(newArticle)
            
                }
                completion(true)
            }
        })
    }
    
    func fetchWeeklyTip(completion: @escaping ([String]) -> Void) {
        db.collection("weekly tips").document("weeklytip").addSnapshotListener { (document, error) in
            if let err = error {
                print("Error in fetching docs: \(err)")
            } else {
                let data = document!.data()
                let thisWeek = data!["thisWeek"] as? String ?? "Couldn't load tip :("
                let lastWeek = data!["lastWeek"] as? String ?? "Couldn't load tip :("
                self.weeklyTipThisandLast[0] = thisWeek
                self.weeklyTipThisandLast[1] = lastWeek
                
                completion(self.weeklyTipThisandLast)
            }
            
        }
    }
}
