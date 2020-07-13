//
//  SwiftTypeExtensions.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation
import SwiftUI

extension Text {
    
    func titleStyle(minWidth: CGFloat? = nil, maxWidth: CGFloat? = nil) -> some View {
        self
            .font(Font.custom("Lato-Bold", size: 100))
            .padding(.vertical, 12)
            .padding(.horizontal, 12)
            .frame(minWidth: minWidth, maxWidth: maxWidth)
            .multilineTextAlignment(.center)
    }
    
    
    func roundedButtonFilledStyle(minWidth: CGFloat? = nil, maxWidth: CGFloat? = nil) -> some View {
        self
            .font(Font.custom("Lato-Bold", size: 20))
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .padding(.horizontal, 40)
            .frame(width: UIScreen.main.bounds.width / 1.5)
            .background(Color.primaryBlue)
            .multilineTextAlignment(.center)
            .cornerRadius(24)
    }
    
    func roundedButtonHollowStyle(minWidth: CGFloat? = nil, maxWidth: CGFloat? = nil) -> some View {
        self
            .font(.headline)
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 50)
            .frame(minWidth: minWidth, maxWidth: maxWidth)
            .background(Color.white)
            .multilineTextAlignment(.center)
            .cornerRadius(12)
    }
}

extension UIColor {
    static let primaryGreen = UIColor(named: "primaryGreen")!
    static let primaryBlue = UIColor(named: "primaryBlue")!
    
    static let secondaryGold = UIColor(named: "secondaryGold")!
    static let secondaryPink = UIColor(named: "secondaryPink")!
    static let secondaryOrange = UIColor(named: "secondaryOrange")!
    static let secondaryMint = UIColor(named: "secondaryMint")!
}

extension Color {
    
    static let primaryGreen = Color(UIColor.primaryGreen)
    static let primaryBlue = Color(UIColor.primaryBlue)
    
    static let secondaryGold = Color(UIColor.secondaryGold)
    static let secondaryPink = Color(UIColor.secondaryPink)
    static let secondaryOrange = Color(UIColor.secondaryOrange)
    static let secondaryMint = Color(UIColor.secondaryMint)
}
