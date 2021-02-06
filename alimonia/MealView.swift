//
//  MealView.swift
//  alimonia
//
//  Created by Tom Pietsch on 28.01.21.
//

import SwiftUI

struct MealView: View {
    @State private var showingAlert = false
    @State private var title: String = ""
    @State private var placeholder: String = "Beschreibung"
    @State private var description: String = ""
    @Binding var showingDetail: Bool
    @Binding var meals: Array<String>
    var body: some View {
        NavigationView {
            ZStack {
                Color (UIColor.systemGroupedBackground)
                    .edgesIgnoringSafeArea(.all)
                VStack (alignment: .leading, spacing: 5) {
                    VStack {
                        TextField(
                            "Titel",
                            text: $title
                        )
                        .font(.body)
                        .padding(.top, 2.0)
                        .autocapitalization(.sentences)
                        Divider()
                        
                        ZStack {
                            if self.description.isEmpty {
                                TextEditor(text:$placeholder)
                                    .font(.body)
                                    .foregroundColor(.gray)
                                    .disabled(true)
                                    .padding([.top, .leading], -3.0)
                            }
                            TextEditor(text: $description)
                                .font(.body)
                                .opacity(self.description.isEmpty ? 0.25 : 1)
                                .padding([.top, .leading], -3.0)
                                .onAppear() {
                                    UITextView.appearance().backgroundColor = UIColor.secondarySystemGroupedBackground
                                }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 200, alignment: .top)
                    .background(Color(UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(16)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding()
                .background(Color (UIColor.systemGroupedBackground))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle(Text("Neue Mahlzeit"), displayMode: .large)
            .navigationBarItems(
                leading: Button("Abbrechen"){
                    self.showingDetail = false
                },
                trailing: Button("Hinzufügen") {
                    self.showingDetail = false
                    self.meals.append(title)
                }
                .disabled(title.isEmpty)
            )
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(showingDetail: .constant(false), meals: .constant(["Essen 1", "Essen 2"]))
    }
}

