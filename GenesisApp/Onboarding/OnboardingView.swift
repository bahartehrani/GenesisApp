//
//  OnboardingView.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    var subviews = [
        UIHostingController(rootView: OnboardSubview(imageString: "Onboarding 1 Illustration")),
        UIHostingController(rootView: OnboardSubview(imageString: "Onboarding 2 Illustration")),
        UIHostingController(rootView: OnboardSubview(imageString: "Onboarding 3 Illustration"))
    ]
    var titles = ["Accessible Curriculum", "Effective Learning", "Financial Empowerment"]
    var captions =  ["With Figure, we provide you a\nvariety of finance topics that\nwere previously difficult to\naccess and understand. ",
                     "Our personal finance lessons are presented in digestible and interactive formats that make learning intuitive and fun. ",
                     "At Figure, our goal is to empower young adults by developing financial practices that will set you up for success. "]
    
    @State var currentPageIndex = 0
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        
        VStack {
             
            
            PageViewController(currentPageIndex: $currentPageIndex, viewControllers: subviews)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.top)
                
            VStack {
                Group {
                    Text(titles[currentPageIndex])
                        .font(Font.custom("Lato-Bold", size: 28))
                        .padding(.bottom)
                        //.padding(.top,6)
                        .padding(.horizontal,28)
                    
                    Text(captions[currentPageIndex])
                        .font(Font.custom("Lato-Regular", size: 18))
                        .lineSpacing(2)
                        .multilineTextAlignment(.center)
                        .padding(.top,8)
                        .padding(.bottom,16)
                        .padding(.horizontal,42)
                        
                    .lineLimit(nil)
                }

                
                HStack {
                    Spacer()
                    if currentPageIndex != 2 {
                        PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                    } else {
                        Button(action: {
                            withAnimation {
                                self.viewRouter.currentPage = "setupView"
                            }
                        }) {
                            Text("Get Started")
                            .roundedButtonFilledStyle()
                        }
                    }
                    Spacer()
                }.padding(.top,8)
                
            }
            
            Spacer()
            
        }.onTapGesture {
            if self.currentPageIndex != 2 {
                if self.currentPageIndex+1 == self.subviews.count {
                    self.currentPageIndex = 0
                } else {
                    self.currentPageIndex += 1
                }
            }
        }
    
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView().environmentObject(ViewRouter())
    }
}
