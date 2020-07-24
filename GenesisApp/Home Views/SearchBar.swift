//
//  SearchBar.swift
//  GenesisApp
//
//  Created by Productivity on 7/6/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $text)
                .font(Font.custom("Lato-Thin", size: 12))
                .padding(7)
                .background(Color(.systemGray6))
                
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))

                .overlay(
                    HStack {
                        
                        if isEditing {
                            Button(action: {
                                self.isEditing = false
                                self.text = ""
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 8)
                            }
                        } else {
                                Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 12)
                        }
                    }
                )
                
                
                
                .padding(.horizontal, 48)
                
                .onTapGesture {
                    self.isEditing = true
                }
 
            
        }
        .padding(.top,20)
        .padding(.bottom,16)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
