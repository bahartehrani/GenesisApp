//
//  LaunchScreen.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Image("Splash Page Logo")
            .padding(.bottom,-60)
            
            Text("Figure")
                .titleStyle()
                .foregroundColor(.primaryArtifact)
            
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
