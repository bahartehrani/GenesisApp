//
//  SignUpViewCollect.swift
//  GenesisApp
//
//  Created by Productivity on 7/14/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct SignUpViewCollect: View {
    
    @EnvironmentObject var session: SessionStore
    
    
    @State var signUpStep : Bool
    
    var body: some View {
    
        VStack {
            if signUpStep {
                SignupView(signUpStep: self.$signUpStep)
            } else {
                SignUpSurveyView()
            }
        }
        
    }
}

struct SignUpViewCollect_Previews: PreviewProvider {
    static var previews: some View {
        SignUpViewCollect(signUpStep: true)
    }
}
