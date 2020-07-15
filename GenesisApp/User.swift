//
//  User.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//
import Foundation
import SwiftUI

class User: Identifiable {
    var uid: String
    var email: String?
    var displayName: String?

    init(uid: String, displayName: String?, email: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}

class UserData: ObservableObject, Identifiable {


    @Published var uid: String {
        didSet {
            UserDefaults.standard.set(uid, forKey: "uid")
        }
    }
    
    @Published var firstName : String {
        didSet {
            UserDefaults.standard.set(firstName, forKey: "firstName")
        }
    }
    @Published var lastName : String {
        didSet {
            UserDefaults.standard.set(lastName, forKey: "lastName")
        }
    }
    
    @Published var email : String {
        didSet {
            UserDefaults.standard.set(email, forKey: "email")
        }
    }
    
    @Published var moneyWeek : Int? {
        didSet {
            UserDefaults.standard.set(moneyWeek, forKey: "moneyWeek")
        }
    }
    
    @Published var starredContent : String? {
        didSet {
            UserDefaults.standard.set(starredContent, forKey: "starredContent")
        }
    }
    
    @Published var recentContent : [String]? {
        didSet {
            UserDefaults.standard.set(recentContent, forKey: "recentContent")
        }
    }
    
    @Published var ageRange : String? {
        didSet {
            UserDefaults.standard.set(ageRange, forKey: "ageRange")
        }
    }
    
    @Published var firstTime : Bool? {
        didSet {
            UserDefaults.standard.set(firstTime, forKey: "firstTime")
        }
    }
    
    
    init() {
        
        self.uid = UserDefaults.standard.object(forKey: "uid") as? String ?? ""
        self.firstName = UserDefaults.standard.object(forKey: "firstName") as? String ?? ""
        self.lastName = UserDefaults.standard.object(forKey: "lastName") as? String ?? ""
        self.email = UserDefaults.standard.object(forKey: "email") as? String ?? ""
        self.moneyWeek = UserDefaults.standard.object(forKey: "moneyWeek") as? Int ?? 0
        self.starredContent = UserDefaults.standard.object(forKey: "starredContent") as? String ?? ""
        self.recentContent = UserDefaults.standard.object(forKey: "recentContent") as? [String] ?? []
        
        self.ageRange = UserDefaults.standard.object(forKey: "ageRange") as? String ?? "Unknown"
        
        self.firstTime = UserDefaults.standard.object(forKey: "firstTime") as? Bool ?? true
    }
    
}

class ViewRouter: ObservableObject {
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
            currentPage = "onboardingView"
        } else {
            currentPage = "contentView"
        }
    }
    
    @Published var currentPage: String
    
}
