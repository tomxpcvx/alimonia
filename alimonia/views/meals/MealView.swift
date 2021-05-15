/* Copyright (C) 2021 tomxpcvx - All Rights Reserved
 * You may use, distribute and modify this code under the
 * terms of the AGPL-3.0 license.
 *
 * You should have received a copy of the AGPL-3.0 license with
 * this software.
 * If not, please write to: dev@tomxpcvx.wtf, or visit:
 * https://github.com/tomxpcvx/alimonia-ios/blob/main/LICENSE
 */


import SwiftUI

/// Bundles all meal related
struct MealView: View {
    @State var showingDetail = false
    
    @Binding var meals: Array<Meal>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("color-background")
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical, showsIndicators: true) {
                    VStack (alignment: .leading) {
                        if meals.count > 0 {
                            ForEach(meals) { meal in
                                MealStack(meal: meal)
                            }
                        } else {
                            VStack (alignment: .leading, spacing: 5) {
                                HStack {
                                    Text("Füge neue Mahlzeiten hinzu!")
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color (UIColor.secondarySystemGroupedBackground))
                            .cornerRadius(16)
                        }
                        
                        Spacer()
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color (UIColor.systemGroupedBackground))
                    .navigationBarTitle("Mahlzeiten")
                    .navigationBarItems(trailing: Button(action: {
                        self.showingDetail.toggle()
                    }) {
                        Image(systemName: "plus.circle").imageScale(.large)
                    }.sheet(isPresented: $showingDetail) {
                        NewMealView(
                            showingDetail: self.$showingDetail,
                            meals: self.$meals
                        )
                    }
                    )
                }
            }
            
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(meals: .constant(
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
                )
            ]
        ))
    }
}
