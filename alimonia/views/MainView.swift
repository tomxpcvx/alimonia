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
    @Environment(\.managedObjectContext) private var viewContext
    
    // autoselect meal tab
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(1)
            MealView()
                .environment(\.managedObjectContext, viewContext)
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Meals")
                }
                .tag(2)
            Text("Weekly planner")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Weekly planner")
                }
                .tag(3)
            Text("Shopping cart")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Shopping cart")
                }
                .tag(4)
        }
    }
}

/// `MainView` preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
