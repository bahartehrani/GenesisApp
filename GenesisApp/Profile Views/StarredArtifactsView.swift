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
    
    @State var subtopic = [
        SubTopic(type: "apple", title: "Bananas"),
        SubTopic(type: "potatos", title: "Tomatoes"),
        SubTopic(type: "rainbows", title: "Unicorns")
    ]

    var body: some View {
        
        VStack {
            HStack {
                
                Text("Starred Artifacts")
                    .font(Font.custom("Lato-Black", size: screen.height > 850 ? 28 : 24))
                    .foregroundColor(.white)
                    .padding(.vertical,18)
                    .padding(.horizontal,32)
                
                
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                //withAnimation {
                    self.showArtifacts.toggle()
                //}
                if !self.showArtifacts {
                    self.bottomState = .zero
                } else {
                    //self.bottomState.height += -screen.height / 1.35
                    if screen.height < 800 {
                        self.bottomState.height += -screen.height / 1.3
                    } else {
                        self.bottomState.height += -screen.height / 1.35
                    }
                    
                }
                print(self.showArtifacts)
            }
            
            if self.bottomState != .zero {
                ScrollView {
                    ForEach(subtopic) { article in
                        
                        NavigationLink(destination: AccountView(toggle: .constant(false)))
                        {
                            SubTopicView(
                                type: article.type, title: article.title
                            )
                        }
                        .foregroundColor(Color(#colorLiteral(red: 0.9614372849, green: 0.9614372849, blue: 0.9614372849, alpha: 1)))

                    }
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 800)
        .background(Color.primaryArtifact)
        .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
//        .cornerRadius(50)
        .edgesIgnoringSafeArea(.all)
        .shadow(radius: 2)
        
    }
}

struct StarredArtifactsView_Previews: PreviewProvider {
    static var previews: some View {
        StarredArtifactsView(showArtifacts: .constant(false),bottomState: .constant(.zero))
    }
}
