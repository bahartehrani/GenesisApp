//
//  EditAccountTextView.swift
//  GenesisApp
//
//  Created by Productivity on 7/27/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct EditAccountTextView: View {
    
    @State var descriptor = ""
    @Binding var text : String
    @State var isSecure : Bool
    
    var body: some View {
        
        VStack {
            HStack {
                Text(self.descriptor)
                    .foregroundColor(.secondaryText)
                .font(Font.custom("Lato-Thin", size: 13))
                    .padding(.top,6)
                .padding(.horizontal,12)
                Spacer()
            }
            if isSecure {
                SecureField("", text: self.$text)
                .font(Font.custom("Lato-Thin", size: 18))
                .foregroundColor(.primaryBlue)
                .padding(.horizontal)
                .padding(.bottom,8)
                .autocapitalization(.words)
                .keyboardType(.alphabet)
                .disableAutocorrection(true)
            } else {
                TextField("", text: self.$text)
                .font(Font.custom("Lato-Thin", size: 18))
                .foregroundColor(.primaryBlue)
                .padding(.horizontal)
                .padding(.bottom,8)
                .autocapitalization(.words)
                .keyboardType(.alphabet)
                .disableAutocorrection(true)
            }
        
        }.overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
        .padding(.horizontal, 25)
    }
}

struct EditAccountTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditAccountTextView(text: .constant("First"), isSecure: false)
    }
}
