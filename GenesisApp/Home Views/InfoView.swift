//
//  InfoView.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/21/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        HStack() {
            Image("TutorialHome")
            .resizable()
            .frame(width: screen.width)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
