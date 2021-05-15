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

/// Bundles the `HomeView`, `MealView`, `PlannerView` and `CartView` in a single `TabView`.
struct MainView: View {

    @State private var meals: Array<Meal> = []
    
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            MealView(meals: $meals)
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Meals")
                }
            Text("Weekly planner")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Weekly planner")
                }
            Text("Shopping cart")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Shopping cart")
                }
        }
    }
}

/// `MainView` preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
