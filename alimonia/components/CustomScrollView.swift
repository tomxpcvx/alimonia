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
    let bgImage: UIImage
    @State private var offset = CGFloat.zero
    
    init(bgImage: UIImage, @ViewBuilder contentBuilder: () -> Content) {
        self.bgImage = bgImage
        self.content = contentBuilder()
        UIScrollView.appearance().bounces = true
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        content
                    }
                    .padding(.top, 16.0)
                    .padding(.bottom, 100)
                }
                .offset(y: 500)
                .padding(.bottom, 500)
            }
            .background(
                GeometryReader {
                    Color.clear.preference(
                        key: ViewOffsetKey.self,
                        value: -$0.frame(in: .named("scroll")).origin.y
                    )
                }
            )
            .onPreferenceChange(ViewOffsetKey.self) {
                self.offset = $0
                //print("offset >> \($0)")
                //print("background >> \($0 >= 600 ? 600 / 400 : $0 / 400)")
                //print("modifier >> \($0 >= 600 ? 600 / 100 : $0 / 100)")
            }
        }
        .coordinateSpace(name: "scroll")
        .background(
            Color(UIColor.systemGroupedBackground)
                .opacity(
                    Double(
                        self.offset >= 600
                            ? 600 / 300
                            : self.offset / 300
                    )
                )
        )
        .modifier(
            BackgroundImage(
                uiImage: bgImage,
                blurRadius: self.offset >= 600
                    ? 600 / 100
                    : self.offset / 100
            )
        )
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
