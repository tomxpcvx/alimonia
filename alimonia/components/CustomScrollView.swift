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

struct CustomScrollView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder contentBuilder: () -> Content) {
        self.content = contentBuilder()
        UIScrollView.appearance().bounces = true
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        content
                    }
                    .padding(.top, 16.0)
                    .padding(.bottom, 100)
                }
                .frame(width: geometry.size.width)
                /*.background(Color(UIColor.systemGroupedBackground).opacity(0.9))
                .mask(LinearGradient(gradient: Gradient(stops: [
                    .init(color: .black, location: 0.95),
                    .init(color: .clear, location: 1)
                ]), startPoint: .top, endPoint: .bottom))*/
                .offset(y: 500)
                .padding(.bottom, 500)
            }
        }
    }
}
