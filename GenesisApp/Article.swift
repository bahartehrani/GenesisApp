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
