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
    @Binding var toggleSearch : Bool
 
    @State private var isEditing = false

    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .font(Font.custom("Lato-Thin", size: 12))
                .padding(7)
                .background(Color(.systemGray6))
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), lineWidth: 1.25))

                .overlay(
                    HStack {
                        if isEditing {
                            Button(action: {
                                    self.isEditing = false
                                    self.toggleSearch = true
                                    UIApplication.shared.endEditing()
                                }) {
                                    Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 12)
                                    }
                            }
                            
                            
//                            Button(action: {
//                                self.isEditing = false
//                                self.text = ""
//                                UIApplication.shared.endEditing()
//                            }) {
//                                Image(systemName: "multiply.circle.fill")
//                                    .foregroundColor(.gray)
//                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
//                                    .padding(.trailing, 8)
//                            }
//                        } else {
//                            Button(action: {
//                                self.toggleSearch = true
//                            }) {
//                            Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
//                            .padding(.trailing, 12)
//                            }
//                        }
                    }
                    
                )
                
            .frame(width: screen.width - 92)
            
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
        SearchBar(text: .constant(""), toggleSearch: .constant(false))
    }
}
