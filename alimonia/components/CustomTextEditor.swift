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

struct CustomTextEditor: View {
    
    let placeholder: String
    @Binding var text: String?
    
    init(_ placeholder: String, _ text: Binding<String?>) {
        self.placeholder = placeholder
        self._text = text
        
        // Removes the background from the TextEditor component
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text(placeholder)
                .font(.system(.body, design: .rounded))
                .padding(EdgeInsets(top: 8, leading: 5, bottom: 0, trailing: 0))
                .foregroundColor(.gray)
                .opacity(text == nil ? 0.6 : 0)
            
            TextEditor(text: Binding($text, replacingNilWith: ""))
                .font(.system(.body, design: .rounded))
                .padding(.all, 0)
                .opacity(text != nil ? 1 : 0.8)
        }
        .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

extension Binding where Value: Equatable {
    init(_ source: Binding<Value?>, replacingNilWith nilProxy: Value) {
        self.init(
            get: { source.wrappedValue ?? nilProxy },
            set: { newValue in
                if newValue == nilProxy {
                    source.wrappedValue = nil
                } else {
                    source.wrappedValue = newValue
                }
            })
    }
}
