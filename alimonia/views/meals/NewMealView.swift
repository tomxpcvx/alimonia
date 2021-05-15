//
//  MealView.swift
//  alimonia
//
//  Created by Tom Pietsch on 28.01.21.
//

import SwiftUI

struct NewMealView: View {
    @State private var meal: Meal = Meal(name: "", notes: "", ingredients: [])
    @Binding var showingDetail: Bool
    @Binding var meals: Array<Meal>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color (UIColor.systemGroupedBackground)
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: true) {
                    VStack (alignment: .leading, spacing: 20) {
                        VStack {
                            TextField(
                                "Name",
                                text: $meal.name
                            )
                            .font(.body)
                            .padding(.all, 4.0)
                            .padding(.bottom, 5.0)
                            .autocapitalization(.sentences)
                            Divider()
                            CustomTextEditor.init(placeholder: "Notizen", text: $meal.notes)
                                .font(.body)
                                .background(Color(UIColor.secondarySystemGroupedBackground))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 220, alignment: .top)
                        .background(Color(UIColor.secondarySystemGroupedBackground))
                        .cornerRadius(12)
                        
                        VStack {
                            if meal.ingredients.count > 0 {
                                ForEach(meal.ingredients) { ingredient in
                                    HStack(alignment: .top, spacing: 15) {
                                        GeometryReader { geometry in
                                            HStack(spacing: 0) {
                                            }
                                        }
                                        .frame(height: 50)
                                        .background(Color(UIColor.secondarySystemGroupedBackground))
                                        .cornerRadius(12)
                                        /*
                                         TextField("Zutat", text: self.$ingredients[index].name).padding()
                                         .frame(maxWidth: .infinity)
                                         .background(Color (UIColor.secondarySystemGroupedBackground))
                                         .cornerRadius(16)
                                         */
                                    }
                                }
                            }
                        }
                        
                        Button(action: {
                            meal.ingredients.append(
                                Ingredient(
                                    name: "",
                                    amount: 1,
                                    uom: Uom.g
                                )
                            )
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("Neue Zutat").bold()
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .top)
                        .cornerRadius(16)
                        .background(Color (UIColor.systemGroupedBackground))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding()
                    .background(Color (UIColor.systemGroupedBackground))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle(Text("Neue Mahlzeit"), displayMode: .large)
            .navigationBarItems(
                leading: Button("Abbrechen"){
                    self.showingDetail = false
                },
                trailing: Button("Hinzufügen") {
                    self.showingDetail = false
                    self.meals.append(meal)
                }
                .disabled(self.meal.name.isEmpty)
            )
        }
    }
}

struct NewMealView_Previews: PreviewProvider {
    static var previews: some View {
        NewMealView(
            showingDetail: .constant(false),
            meals: .constant(
                [
                    Meal(
                        name: "Caesar Salad",
                        notes: "American style, great with grilled or short roasted meat.",
                        ingredients: [
                            Ingredient(
                                name: "1",
                                amount: 2,
                                uom: Uom.kg
                            )
                        ]
                    ),
                    Meal(
                        name: "Caesar Salad 2",
                        notes: "American style, great with grilled or short roasted meat.",
                        ingredients: [
                            Ingredient(
                                name: "1",
                                amount: 2,
                                uom: Uom.kg
                            )
                        ]
                    )
                ]
            )
        )
    }
}

