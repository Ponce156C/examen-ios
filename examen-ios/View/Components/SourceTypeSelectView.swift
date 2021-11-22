//
//  SourceTypeSelectView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 21/11/21.
//

import SwiftUI

struct SourceTypeSelectView: View {
    
    @Binding var isLibrary: Bool
    @Binding var isCamera: Bool
    
    var body: some View {
        VStack{
            Button {
                self.isLibrary = true
            } label: {
                Text("Biblioteca de fotos")
            }
            .padding(20)
            .frame(width: 200, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
            Button {
                self.isCamera = true
            } label: {
                Text("Camara")
            }
            .padding(20)
            .frame(width: 200, alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(5)
        }

    }
}
