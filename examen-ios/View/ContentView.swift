//
//  ContentView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 20/11/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var isShowPhotoLibrary = false
    @State private var userImage: UIImage = UIImage()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (spacing:10) {
                TextFieldRowView(name: "")
                Button(action: {
                    self.isShowPhotoLibrary = true
                }) {
                    ImageRowView(ImageSelected: self.$userImage)
                }
            }.padding()
                .sheet(isPresented: $isShowPhotoLibrary) {
                    
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$userImage)
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
