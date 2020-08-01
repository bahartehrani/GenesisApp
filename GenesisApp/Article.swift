//
//  Article.swift
//  GenesisApp
//
//  Created by Productivity on 7/20/20.
//  Copyright © 2020 Genesis. All rights reserved.
//
import Foundation
import SwiftUI

struct Article : Identifiable {
    var id = UUID()
    var articleBody: String
    var articleName: String
    var author: String
    var dateCreated: String
    var maintopic: String
    var subtopic: String
    var type: String
    
}

struct MainTopicOverview : Identifiable {
    
    var id = UUID()
    
    var title: String
    var subtopics: [String]
    var description: String
    var subtopicArtifacts : [String : [SubTopic]]

}

struct StarredArtifact : Identifiable, Equatable {
    static func == (lhs: StarredArtifact, rhs: StarredArtifact) -> Bool {
      return lhs.title == rhs.title
    }
    
    var id = UUID()
    var type: String
    var maintopic: String
    var title: String
}


struct SubTopic : Identifiable {
    var id = UUID()
    var type: String
    var title: String
}

struct recentlyViewed : Identifiable, Equatable {
    
    static func == (lhs: recentlyViewed, rhs: recentlyViewed) -> Bool {
      return lhs.title == rhs.title && lhs.maintopic == rhs.maintopic
    }
    
    var id = UUID()
    var maintopic: String
    var title : String
}
