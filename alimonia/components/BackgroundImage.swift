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

struct BackgroundImage: ViewModifier {
    
    let uiImage: UIImage
    let blurRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .opacity(0.8)
            .background(
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .mask(LinearGradient(gradient: Gradient(stops: [
                        .init(color: .black, location: 0.7),
                        .init(color: .clear, location: 1)
                    ]), startPoint: .top, endPoint: .bottom))
                    .blur(radius: blurRadius)
            )
    }
}
