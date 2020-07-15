//
//  CommentedOutCode.swift
//  GenesisApp
//
//  Created by Productivity on 7/15/20.
//  Copyright © 2020 Genesis. All rights reserved.
//

import Foundation

// This is where code that got changed goes:

// In Topicview, the code for the buttons at top:

//ScrollView (.horizontal) {
//                    HStack(spacing: 50) {
//                        Button(action: {
//                            self.showLoans = true;
//                            self.showCredit = false;
//                            self.showDebt = false;
//                        }) {
//                        Text("Loans")
//                        }
////                        .padding(.leading)
//                        Button(action: {
//                            self.showLoans = false;
//                            self.showCredit = true;
//                            self.showDebt = false;
//                        }) {
//                        Text("Credit")
//                        }
//                        Button(action: {
//                            self.showLoans = false;
//                            self.showCredit = false;
//                            self.showDebt = true;
//                        }) {
//                        Text("Debt")
//                        }
//                    }
//                    .frame(width: screen.width)
//                    .font(.custom("Lato-Black", size: 24))
//                }
                
//                .padding(.top, 24)
//                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                .clipShape(RoundedRectangle(cornerRadius: 50, style: .continuous))
//                .offset(x: 0, y: -30)

//                if showLoans{
//                    ScrollView {
//                        ForEach(subtopic1.indices, id: \.self) { index in
//                            SubTopicView(type: self.subtopic1[index].type, title: self.subtopic1[index].title
//                            )
//                        }
//                    }
//                }
                
//                if showCredit{
//                    ScrollView {
//                        ForEach(subtopic2.indices, id: \.self) { index in
//                            SubTopicView(type: self.subtopic2[index].type, title: self.subtopic2[index].title
//                            )
//                        }
//                    }
//                }
                
//                if showDebt{
//                    ScrollView {
//                        ForEach(subtopic3.indices, id: \.self) { index in
//                            SubTopicView(type: self.subtopic3[index].type, title: self.subtopic3[index].title
//                            )
//                        }
//                    }
//                }
