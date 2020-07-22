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
