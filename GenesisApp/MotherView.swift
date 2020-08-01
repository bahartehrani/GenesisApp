//
//  MotherView.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct MotherView : View {
    
    @State var isActive = false
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var session: SessionStore
    
    var topicArticles = ArticleStore()
    var userInfo = UserData()
    
    func getUser () {
         session.listen()
     }
    
    var body: some View {
        VStack {
            if self.isActive {
                if viewRouter.currentPage == "onboardingView" {
                    OnboardingView()
                } else if viewRouter.currentPage == "contentView" && session.session != nil {
                    ContentView(toggleInfo: false)
                } else {
                    SetupView()
                }
                // if viewRouter.currentPage == "setupView"
            } else {
                // splash screen
                LaunchScreen()
                    .transition(.opacity)
                    .onAppear(perform: {
                        for str in self.userInfo.recentContent! {
                            let subarr = str.components(separatedBy: ",")
                            let recview = recentlyViewed(maintopic: subarr[0], title: subarr[1])
                            self.userInfo.recentContentMod.append(recview)
                        }
                        
                        for str in self.userInfo.starredContent! {
                            let subarr = str.components(separatedBy: ",")
                            let recview = StarredArtifact(type: subarr[0], maintopic: subarr[1], title: subarr[2])
                            self.userInfo.starredContentMod.append(recview)
                        }
                    })
                
            }
        }
        //.transition(.slide)
        .environmentObject(userInfo)
        .environmentObject(topicArticles)
        .onAppear(perform: getUser)
        .onAppear {
            // 6.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                // 7.
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView().environmentObject(ViewRouter())
    }
}
