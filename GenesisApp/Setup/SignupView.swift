//
//  SignupView.swift
//  GenesisApp
//
//  Created by Productivity on 7/13/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI
import Firebase

struct SignupView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var signUpStep : Bool
    
    @State var typedPassword = ""
    @State var typedConfirmPassword = ""
    @State var agreed = false
    
    @State var showAlert = false
    @State var termsMessage = "Please agree to our terms and conditions to proceed."
    @State var alertMessage = "Something went wrong. "
    
    var db = Firestore.firestore()
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var userInfo : UserData
    
    func signingUp() {
        if self.typedPassword != self.typedConfirmPassword {
            self.showAlert = true
            self.alertMessage = "Passwords do not match. "
        }
        if !self.agreed {
            self.showAlert = true
            self.alertMessage = self.termsMessage
        }
        else if self.agreed && self.typedPassword == self.typedConfirmPassword {
            session.signUp(email: self.userInfo.email, password: typedPassword) { (result, error) in
                if error != nil {
                    self.showAlert = true
                    self.alertMessage = (error?.localizedDescription ?? "Something went wrong. ")
                    
                } else {
                    self.showAlert = false
                    
                    self.userInfo.uid = (result?.user.uid)!
                    self.db.collection("users").document((result?.user.uid)!).setData([
                        "uid" : self.userInfo.uid,
                        "firstName" : self.userInfo.firstName,
                        "lastName" : self.userInfo.lastName,
                        "email" : self.userInfo.email
                    ])

                }
            }
            
            //
            
        }
    }
    
    var body: some View {
            VStack {
                
                
                HStack {
                    Text("Sign Up")
                    .font(Font.custom("Lato-Bold", size: 32))
                     
                    Spacer()
                }
                    .padding(.horizontal,36)
                    .padding(.vertical)
                
                
                
                VStack {
                    Group {
                        TextField("First Name", text: self.$userInfo.firstName)
                            .signUpTFStyle()
                            .padding(.vertical,8)
                            .autocapitalization(.words)
                            .keyboardType(.alphabet)
                            .disableAutocorrection(true)
                        
                        
                        
                        TextField("Last Name", text: self.$userInfo.lastName)
                            .signUpTFStyle()
                            .autocapitalization(.words)
                            .keyboardType(.alphabet)
                            .disableAutocorrection(true)
                        
                        
                        
                        TextField("Email", text: self.$userInfo.email)
                            .signUpTFStyle()
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .disableAutocorrection(true)
                        
                        
                        
                        SecureField("Password", text: self.$typedPassword)
                            .signUpTFStyle()
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                        
                        
                        SecureField("Confirm Password", text: self.$typedConfirmPassword)
                            .signUpTFStyle()
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        
                        
                    }
                        .padding(.horizontal)
                        .padding(.vertical,8)
                }
                    
                
                HStack {
                    Button(action: {
                        self.agreed.toggle()
                    }, label: {
                        Image(systemName: self.agreed ? "checkmark.square.fill" : "square")
                            .foregroundColor(.primaryBlue)
                    })
                    
                    Text("I agree to the terms and conditions")
                        .font(.footnote)
                        .foregroundColor(.secondaryText)
                }.padding(.vertical)
                
                Spacer()
                
                NavigationLink(destination: SignUpSurveyView()) {
                    Button(action: {
                        self.signingUp()
                        withAnimation {
                            self.signUpStep = false
                        }
                    }, label: {
                        Text("Next")
                        .roundedSmallButtonHollowStyle()
                    }).padding(.vertical)
                    .alert(isPresented: self.$showAlert) {
                    Alert(title: Text("Error "), message:
                            Text(self.alertMessage), dismissButton:
                            .default(Text("OK")))
                    }
                }
                
                
                Spacer()
                    
            }.offset(y: -30)
        .navigationBarBackButtonHidden(true)
            .navigationBarItems(
            leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image("Backward arrow small")
                    .font(.system(size: 24))
                    .foregroundColor(.secondaryText)
                    .padding()
                
        }))
            //.offset(y: -60)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(signUpStep: .constant(true)).environmentObject(UserData())
    }
}
