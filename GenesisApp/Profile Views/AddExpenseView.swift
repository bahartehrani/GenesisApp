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
    @Binding var toggleAdd : Bool
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {

        VStack (spacing: 20){
            HStack {
                Text("Add Expense")
                    .font(Font.custom("Lato-Black", size: 25))
                Spacer()
                
                Button(action: {
                    self.toggleAdd.toggle()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 18, weight: .bold))
                        .padding(.bottom, 16)
                        .foregroundColor(Color.primaryBlue)
                }
                
            }
            
            TextField("Transaction Name", text: $transaction)
                .font(Font.custom("Lato-Regular", size: 16))
                .padding(.vertical, 16)
                .padding(.horizontal, 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
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
                        .stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                )
                
                Spacer()
                
                TextField("Amount", text: $amount)
                .font(Font.custom("Lato-Regular", size: 16))
                .padding(16)
                    .frame(width: 150)
                .frame( maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                )
                
            }
            
            Button(action: {}) {
                Text("Add Expense")
                    .roundedButtonFilledStyle()
            }
            .frame(maxWidth: 200, maxHeight: 50)
            .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
            .shadow(color: Color.gray, radius: 1, x: 2, y: 2)
        }
        .padding(.vertical, 42)
        .padding(.horizontal, 32)
        .background(Color(.white))
        .frame(width: screen.width - 30, height: 300)
        .clipShape(RoundedRectangle(cornerRadius: 21, style: .continuous))
//        .overlay(
//            RoundedRectangle(cornerRadius: 30)
//                .stroke(Color.black)
//        )
            .shadow(color: .gray, radius: 3)
            .offset(x: 0, y: -10)
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(toggleAdd: .constant(true))
    }
}
