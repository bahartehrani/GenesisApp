//
//  InfoSubview.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/21/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct InfoSubview: View {
    @State var background: String
    @State var woman: String
    var body: some View {
           ZStack {
                Image(background)
                .resizable()
                .frame(width: screen.width)

                Image(woman)
                .offset(x: 90, y: 350)
            }
//            .statusBar(hidden: true)
            .edgesIgnoringSafeArea(.all)
    }
}

struct InfoSubview_Previews: PreviewProvider {
    static var previews: some View {
        InfoSubview(background: "TutorialHome", woman: "TutorialPointer1")
    }
}
