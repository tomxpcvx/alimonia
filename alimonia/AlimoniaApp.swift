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

/// App entry point.
@main
struct AlimoniaApp: App {
    let context = DataStore.shared.persistentContainer.viewContext
    var body: some Scene {
        WindowGroup {
            MainView().environment(\.managedObjectContext, context)
        }
    }
}

/// App preview
struct AlimoniaApp_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
