//
//  OnboardSubview.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct OnboardSubview: View {
    var imageString: String
    
    var body: some View {
        Image(imageString)
            //.resizable()
            .frame(width: UIScreen.main.bounds.width)
            .aspectRatio(contentMode: .fill)
            .clipped()
            .edgesIgnoringSafeArea(.all)
            
    }
}

struct OnboardSubview_Previews: PreviewProvider {
    static var previews: some View {
        OnboardSubview(imageString: "Onboarding 2 Illustration")
    }
}
