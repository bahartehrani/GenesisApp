//
//  AddExpenseView.swift
//  GenesisApp
//
//  Created by Sophie Cui on 7/16/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import SwiftUI

struct AddExpenseView: View {
    @State var transaction: String = ""
    @State var month: String = ""
    @State var day: String = ""
    @State var amount: String = ""
//    @State var toggleAdd = false
    @State var toggleClose : Bool
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {

        VStack (spacing: 20){
            HStack {
                Text("Add Expense")
                    .font(Font.custom("Lato-Black", size: 25))
                Spacer()
                Image(systemName: "xmark")
                    .font(.system(size: 16, weight: .bold))
                    .padding(.bottom, 16)
                    .foregroundColor(Color.primaryBlue)
                    .onTapGesture {
                        self.toggleClose.toggle()
                }
            }
            
            TextField("Transaction Name", text: $transaction)
                .font(Font.custom("Lato-Regular", size: 16))
                .padding(.vertical, 16)
                .padding(.horizontal, 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black)
                )
            
            HStack {
                HStack {
                    
                    TextField("Month", text: $month)
                        .keyboardType(.numberPad)
                    
                    Divider()
                    
                    TextField("Day", text: $day)
                        .keyboardType(.numberPad)
                }
                .font(Font.custom("Lato-Regular", size: 16))
                .padding(16)
                .frame(width: 150)
                .frame( maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black)
                )
                
                Spacer()
                
                TextField("Amount", text: $amount)
                .font(Font.custom("Lato-Regular", size: 16))
                .padding(16)
                    .frame(width: 150)
                .frame( maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black)
                )
                
            }
            
            Button(action: {}) {
                Text("Add Expense")
            }
            .foregroundColor(.white)
            .font(Font.custom("Lato-Black", size: 16))
            .padding(.vertical, 16)
            .frame(maxWidth: 200, maxHeight: 50)
            .background(Color.primaryBlue)
            .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
            .shadow(color: Color.gray, radius: 1, x: 2, y: 2)
        }
        .padding(32)
        .frame(width: 360, height: 300)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.black)
        )
            .offset(x: 0, y: toggleClose ? 1000 : 0)
            .animation(.spring(response: 0.8))
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(toggleClose: false)
    }
}
