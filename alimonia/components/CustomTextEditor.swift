//
//  CustomTextEditor.swift
//  alimonia
//
//  Created by Tom Pietsch on 25.04.21.
//

import SwiftUI

struct CustomTextEditor: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text(text).opacity(0).padding(.all, 8)
            TextEditor(text: $text)
                .multilineTextAlignment(.leading)
                .foregroundColor(self.text == placeholder ? Color(UIColor.systemGray2) : .primary)
                .onTapGesture {
                    if self.text == placeholder {
                        self.text = ""
                    }
                }
        }.onAppear() {
            UITextView.appearance().backgroundColor = .clear
            text = placeholder
        }.onDisappear() {
            UITextView.appearance().backgroundColor = nil
        }
    }
}
