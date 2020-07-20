//
//  SwiftTypeExtensions.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation
import SwiftUI

// checking is git is messing up

extension TextField {
    
    func signUpTFStyle() -> some View {
        self
            .font(Font.custom("Lato-Thin", size: 14))
            .foregroundColor(.primaryBlue)
            .padding(.horizontal)
            .padding(.vertical,12)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
            .padding(.horizontal, 25)
    }
    
    func numEnter() -> some View {
        self
            .font(Font.custom("Lato-Thin", size: 14))
            .foregroundColor(.primaryBlue)
            .padding(.horizontal)
            .padding(.vertical,12)
            .frame(width: UIScreen.main.bounds.width / 3)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
    }
    
}

extension SecureField {
    
    func signUpTFStyle() -> some View {
        self
            .font(Font.custom("Lato-Thin", size: 14))
            .foregroundColor(.primaryBlue)
            .padding(.horizontal)
            .padding(.vertical,10)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
            .padding(.horizontal, 25)
    }
    
}

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
    
    func roundedSmallButtonFilledStyle(minWidth: CGFloat? = nil, maxWidth: CGFloat? = nil) -> some View {
        self
            .font(Font.custom("Lato-Bold", size: 20))
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .padding(.horizontal, 40)
            .frame(width: UIScreen.main.bounds.width / 2)
            .background(Color.primaryBlue)
            .multilineTextAlignment(.center)
            .cornerRadius(24)
    }
    
    func roundedButtonHollowStyle(minWidth: CGFloat? = nil, maxWidth: CGFloat? = nil) -> some View {
        self
            .font(Font.custom("Lato-Bold", size: 20))
            .foregroundColor(.primaryBlue)
            .padding(.vertical, 16)
            .padding(.horizontal, 40)
            .frame(width: UIScreen.main.bounds.width / 1.5)
            .background(Color.white)
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.primaryBlue, lineWidth: 4)
            )
    }
    
    func roundedSmallButtonHollowStyle(minWidth: CGFloat? = nil, maxWidth: CGFloat? = nil) -> some View {
        self
            .font(Font.custom("Lato-Bold", size: 16))
            .foregroundColor(.primaryBlue)
            .padding(.vertical, 16)
            .padding(.horizontal, 40)
            .frame(width: UIScreen.main.bounds.width / 2)
            .background(Color.white)
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.primaryBlue, lineWidth: 4)
            )
    }
    
    
}

extension UIColor {
    static let primaryGreen = UIColor(named: "primaryGreen")!
    static let primaryBlue = UIColor(named: "primaryBlue")!
    
    static let secondaryGold = UIColor(named: "secondaryGold")!
    static let secondaryPink = UIColor(named: "secondaryPink")!
    static let secondaryOrange = UIColor(named: "secondaryOrange")!
    static let secondaryMint = UIColor(named: "secondaryMint")!
    static let secondaryText = UIColor(named: "secondaryText")!
    static let primaryArtifact = UIColor(named: "primaryArtifact")!
}

extension Color {
    
    static let primaryGreen = Color(UIColor.primaryGreen)
    static let primaryBlue = Color(UIColor.primaryBlue)
    
    static let secondaryGold = Color(UIColor.secondaryGold)
    static let secondaryPink = Color(UIColor.secondaryPink)
    static let secondaryOrange = Color(UIColor.secondaryOrange)
    static let secondaryMint = Color(UIColor.secondaryMint)
    static let secondaryText = Color(UIColor.secondaryText)
    static let primaryArtifact = Color(UIColor.primaryArtifact)
}

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {

                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)

                VStack {
                    Text("Logging in...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)

            }
        }
    }
}

struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content

    @GestureState private var translation: CGFloat = 0

    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }

    var body: some View {
        
        VStack {
            GeometryReader { geometry in
                
                HStack(spacing: 0) {
                    self.content.frame(width: geometry.size.width)
                }
                .frame(width: geometry.size.width, alignment: .leading)
                .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
                .offset(x: self.translation)
                .animation(.interactiveSpring(), value: self.translation)
                .animation(.interactiveSpring(), value: self.currentIndex)
                .gesture(
                    DragGesture().updating(self.$translation) { value, state, _ in
                        state = value.translation.width
                    }.onEnded { value in
                        let offset = value.translation.width / geometry.size.width
                        let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                        self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                    
                        
                    }
                )

            }.padding(.top,3)
        }
    }
}
