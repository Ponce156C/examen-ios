//
//  TextFieldRowView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 21/11/21.
//

import SwiftUI
import Combine

struct TextFieldRowView: View {
    @State var name = ""
    @State var isTextFieldFocused = false
    var body: some View {
        TextField("Nombre", text: $name, onEditingChanged: { isEditing in
                isTextFieldFocused = isEditing
        })
            .foregroundColor(isTextFieldFocused ? Color.black : Color.gray)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .cornerRadius(5)
            .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 0.5))
            .onReceive(Just(self.name)) { newValue in
                self.name.alphanumericValidator(newValue: newValue)
            }
    }
}

extension String {
    mutating func alphanumericValidator(newValue: String) {
        let alphabet = "abcdefghijklmnñopqrstuvwxyz"
        let numbers = "1234567890"
        let alphanumericValue = alphabet + alphabet.uppercased() + numbers
        let filter = newValue.filter {alphanumericValue.contains($0)}
        if filter != newValue {
            self = filter
        }
    }
}

struct TextFieldRowView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldRowView()
            .previewLayout(.fixed(width: 350.0, height: 100))
    }
}
