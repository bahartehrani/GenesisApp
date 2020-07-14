//
//  SignUpSurveyView.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI
import Firebase

struct SignUpSurveyView: View {
    
    var db = Firestore.firestore()
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var userInfo : UserData
    
    @State var ageRange = ""
    @State var firstTime = ""
    @State var amountPerWeek = ""
    
    func finishSignUp() {
        
        self.userInfo.ageRange = self.ageRange
        self.userInfo.firstTime = self.firstTime == "Yes" ? true : false
        self.userInfo.moneyWeek = Int(self.amountPerWeek) ?? 0
        
        self.db.collection("users").document(self.session.session!.uid).setData([
            "ageRange" : self.userInfo.ageRange ?? "Unknown",
            "firstTime" : self.userInfo.firstTime ?? true,
            "moneyWeek" : self.userInfo.moneyWeek ?? 0
        ], merge: true)
        
        
    }
    
    var body: some View {
         
            
            VStack {
                HStack {
                    Text("Survey")
                    .font(Font.custom("Lato-Bold", size: 32))
                     
                    Spacer()
                }
                    .padding(.horizontal,36)
                    .padding(.vertical)
                
                Group {
                    HStack {
                        Text("What is your age range?")
                            .font(Font.custom("Lato-Bold", size: 18))
                            .foregroundColor(.secondaryText)
                            .padding(.horizontal,12)
                        
                        Spacer()
                    }.padding()
                    
                    HStack {
                        surveyButton(choice: "Under 18", returnOption: self.$ageRange)
                        
                        Spacer()
                    }.padding(.horizontal,32)
                    
                    HStack {
                        surveyButton(choice: "18-22", returnOption: self.$ageRange)
                        
                        Spacer()
                    }.padding(.horizontal,32)
                    
                    HStack {
                        surveyButton(choice: "23-29", returnOption: self.$ageRange)
                        
                        Spacer()
                    }.padding(.horizontal,32)
                    
                    HStack {
                        surveyButton(choice: "30+", returnOption: self.$ageRange)
                        
                        Spacer()
                    }.padding(.horizontal,32)
                }
                
                
                Group {
                    HStack {
                        Text("Is this your first time learning about personal finance?")
                            .font(Font.custom("Lato-Bold", size: 18))
                            .foregroundColor(.secondaryText)
                            .padding(.horizontal,12)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }.padding()
                    
                    HStack {
                        surveyButton(choice: "Yes", returnOption: self.$firstTime)
                        
                        Spacer()
                    }.padding(.horizontal,32)
                    
                    HStack {
                        surveyButton(choice: "No", returnOption: self.$firstTime)
                        
                        Spacer()
                    }.padding(.horizontal,32)
                }
                
                Group {
                    HStack {
                        Text("What is the maximum amount you want to spend per week?")
                            .font(Font.custom("Lato-Bold", size: 18))
                            .foregroundColor(.secondaryText)
                            .padding(.horizontal,12)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }.padding()
                    
                    HStack {
                        TextField("$ Amount", text: self.$amountPerWeek)
                        .numEnter()

                        Spacer()
                    }.padding(.horizontal,32)
                }
                
                Button(action: {
                    self.finishSignUp()
                    withAnimation {
                        self.viewRouter.currentPage = "contentView"
                    }
                }, label: {
                    Text("Sign Up")
                    .roundedSmallButtonFilledStyle()
                }).padding(.top,32)
                
            }.offset(x: 0, y:-40)
            
               

                
            
                .navigationBarItems(
                trailing: Button(action: {
                    self.finishSignUp()
                    withAnimation {
                        self.viewRouter.currentPage = "contentView"
                    }
                }, label: {
                    Text("Skip")
                        .foregroundColor(.secondaryText)
                        .padding()
                    
                })
            )
        
    }
}

struct surveyButton : View {
    
    @State var choice : String
    @Binding var returnOption : String
    
    var body : some View {
        
        HStack {
            Image(systemName: self.returnOption == self.choice ? "largecircle.fill.circle" : "circle")
                .foregroundColor(.secondaryText)
                .padding(.horizontal)
            
            Text(choice)
                .font(Font.custom("Lato-Regular", size: 17))
                .foregroundColor(.secondaryText)
        }.padding(.vertical,4)
        .onTapGesture {
                withAnimation {
                    self.returnOption = self.choice
                }
        }
        
    }

}


struct SignUpSurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSurveyView().environmentObject(UserData())
    }
}
