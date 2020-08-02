//
//  InfoView.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/21/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    @Binding var toggle : Bool
    
    var subviews = [
        UIHostingController(rootView: InfoSubview(background: "TutorialHome", woman: "TutorialPointer1")),
        UIHostingController(rootView: InfoSubview(background: "TutorialHome", woman: "TutorialPointer2")),
        UIHostingController(rootView: InfoSubview(background: "TutorialProfile", woman: "TutorialPointer3")),
        UIHostingController(rootView: InfoSubview(background: "TutorialHome", woman: "TutorialPointer4")),
    ]
    
    @State var currentPageIndex = 0
    
    var body: some View {
        
        ZStack {
            
            VStack {

                PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
                
            }
            .statusBar(hidden: true)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                if self.currentPageIndex == 3{
                    self.toggle = false

                } else {
                    self.currentPageIndex += 1
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(toggle: .constant(true))
    }
}
