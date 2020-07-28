//
//  EditAccountView.swift
//  GenesisApp
//
//  Created by Productivity on 7/27/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI
import Firebase

struct EditAccountView: View {
    //@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var userInfo : UserData
    @State var typedPassword = ""
    @State var typedConfirmPassword = ""
    
    @State var oldEmail = ""
    @State var email = ""
    @State var firstname = ""
    @State var lastname = ""
    @State var amountPerWeek = ""
    @State var oldAmountPW = ""
    
    @Binding var showEditAccount : Bool
    
    @State var showAlert = false
    @State var alertMessage = "Something went wrong. "
    
    var db = Firestore.firestore()
    
    func editProf() {
        if self.oldEmail != self.email {
            db.collection("users").whereField("email",isEqualTo: email).getDocuments { (snapshot, error) in
                if let err = error {
                    print("Error in fetching docs: \(err)")
                } else {
                    for document in snapshot!.documents {
                        self.showAlert = true
                        self.alertMessage = "That email is taken. "
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
        }
        
        if !self.showAlert {
            
            db.collection("users").document(self.userInfo.uid).updateData([
                "firstName" : self.userInfo.firstName,
                "lastName" : self.userInfo.lastName,
                "email" : self.userInfo.email,
                "moneyWeek" : self.userInfo.moneyWeek ?? 20
            ])
        }
    }
    
    
    var body: some View {
            VStack {
                
                VStack {
                    HStack {
                        Button(action: {
                                //self.presentationMode.wrappedValue.dismiss()
                                self.showEditAccount = false
                            }, label: {
                                Image("Backward arrow small")
                                    .font(.system(size: 24))
                                    .foregroundColor(.secondaryText)
                                    .padding()
                                
                        })
                        
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack {
                        Text("Edit Account")
                        .font(Font.custom("Lato-Bold", size: 32))
                         
                        Spacer()
                    }
                        .padding(.horizontal,36)
                        .padding(.bottom, 16)
                    
                    
                    
                    VStack {
                        Group {
                            EditAccountTextView(descriptor: "First Name", text: self.$firstname, isSecure: false)
                            
                            EditAccountTextView(descriptor: "Last Name", text: self.$lastname, isSecure: false)
                            
                            EditAccountTextView(descriptor: "Email", text: self.$email, isSecure: false)
                            
                            EditAccountTextView(descriptor: "Password", text: self.$typedPassword, isSecure: true)
                            
                            EditAccountTextView(descriptor: "Confirm Password", text: self.$typedConfirmPassword, isSecure: true)
                            
                            EditAccountTextView(descriptor: "Weekly Expense Limit ($)", text: self.$amountPerWeek, isSecure: false)
                                .keyboardType(.numberPad)
                            
                        }
                            .padding(.horizontal)
                            .padding(.vertical,8)
                    }
                }
//                .padding(.bottom)
                .modifier(AdaptsToKeyboard())
                    
                
                Button(action: {
                    
                    self.userInfo.firstName = self.firstname
                    self.userInfo.lastName = self.lastname
                    self.oldAmountPW = "\(self.userInfo.moneyWeek ?? 20)"
                    self.userInfo.moneyWeek = Int(self.amountPerWeek) ?? 0
                    self.oldEmail = self.userInfo.email
                    self.userInfo.email = self.email
                    
                    if self.typedPassword != self.typedConfirmPassword {
                        self.showAlert = true
                        self.alertMessage = "Passwords do not match. "
                    }
                    if (Int(self.amountPerWeek) == nil) && self.amountPerWeek != "" {
                        self.showAlert = true
                        self.alertMessage = "Enter a numeric value please. "
                        self.amountPerWeek = self.oldAmountPW
                    }
                    if !self.showAlert {
                        self.editProf()
                        self.showEditAccount = false
                    }
                    //self.presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Text("Save Edits")
                    .roundedSmallButtonFilledStyle()
                })
                .padding(.vertical)
                .padding(.bottom, 16)
                
                
                Spacer()
                    
            }
            .onAppear(perform: {
                self.firstname = self.userInfo.firstName
                self.lastname = self.userInfo.lastName
                self.email = self.userInfo.email
                self.amountPerWeek = "\(self.userInfo.moneyWeek ?? 20)"
            })
                .offset(y: screen.height > 800 ? -30 : 10)
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: self.$showAlert) {
            Alert(title: Text("Error "), message:
                    Text(self.alertMessage), dismissButton:
                    .default(Text("OK")))
        }
            //.offset(y: -60)
    }
}

struct EditAccountView_Previews: PreviewProvider {
    static var previews: some View {
        EditAccountView(showEditAccount: .constant(true))
    }
}
