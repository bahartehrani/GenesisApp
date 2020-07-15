//
//  StarredArtifactsView.swift
//  GenesisApp
//
//  Created by Productivity on 7/15/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct StarredArtifactsView: View {
    @Binding var showArtifacts : Bool
    @Binding var bottomState : CGSize

    var body: some View {
        
        VStack {
            HStack {
                
                Text("Starred Artifacts")
                    .font(Font.custom("Lato-Black", size: 28))
                    .foregroundColor(.white)
                    .padding(.vertical,24)
                    .padding(.horizontal,32)
                
                
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.showArtifacts.toggle()
                if !self.showArtifacts {
                    self.bottomState = .zero
                } else {
                    self.bottomState.height += -605
                }
                print(self.showArtifacts)
            }
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.primaryArtifact)
        .cornerRadius(50)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct StarredArtifactsView_Previews: PreviewProvider {
    static var previews: some View {
        StarredArtifactsView(showArtifacts: .constant(false),bottomState: .constant(.zero))
    }
}
