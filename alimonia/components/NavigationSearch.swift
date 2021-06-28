//
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
import UIKit

struct NavigationSearch: UIViewControllerRepresentable {
    typealias UIViewControllerType = Wrapper
    
    func makeCoordinator() -> Coordinator {
        Coordinator(representable: self)
    }

    func makeUIViewController(context: Context) -> Wrapper {
        Wrapper()
    }
    
    func updateUIViewController(_ wrapper: Wrapper, context: Context) {
        wrapper.searchController = context.coordinator.searchController
    }
    
    class Coordinator: NSObject {
        let representable: NavigationSearch
        
        let searchController: UISearchController
        
        init(representable: NavigationSearch) {
            self.representable = representable
            self.searchController = UISearchController(searchResultsController: nil)
            super.init()
        }
    }
    
    class Wrapper: UIViewController {
        var searchController: UISearchController? {
            get {
                self.parent?.navigationItem.searchController
            }
            set {
                self.parent?.navigationItem.searchController = newValue
            }
        }
    }
}
