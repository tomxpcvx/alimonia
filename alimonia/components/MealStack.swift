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

struct MealStack: View {
    var meal: Meal
    
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            HStack {
                Text(meal.name)
                Spacer()
            }
            .font(Font.largeTitle.bold())
            .foregroundColor(.green)
            
            HStack {
                Text (meal.notes)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color (UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
    }
}

struct MealStack_Previews: PreviewProvider {
    static var previews: some View {
        MealStack(
            meal: Meal(
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
            
        )
    }
}
