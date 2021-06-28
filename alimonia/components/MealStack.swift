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
        VStack(alignment: .leading, spacing: 0) {
            VStack {
                Image(uiImage: UIImage(
                    data: (
                        meal.img ??
                            UIImage(named: "Placeholder")?
                            .jpegData(compressionQuality: 1)
                    )!
                )!
                )
                .resizable()
                .scaledToFill()
                .frame(width: 165, height:165)
                .clipped()
                VStack {
                    Text(meal.name!)
                        .font(.system(size: 14))
                        .frame(width: 165, height: 10, alignment: .topLeading)
                        .padding(.bottom, 0.1)
                        .padding(.leading, 25)
                    Text (meal.notes ?? "")
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .font(.system(size: 12))
                        .frame(width: 165, height: 40, alignment: .topLeading)
                        .padding(.leading, 25)
                }
            }
        }
        .frame(width: 165, height: 220)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(16)
    }
}

struct MealStack_Previews: PreviewProvider {
    static var previews: some View {
         MealStack(meal: Meal())
    }
}
