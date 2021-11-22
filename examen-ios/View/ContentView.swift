//
//  ContentView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 20/11/21.
//

import SwiftUI
import UIKit
import PartialSheet

struct ContentView: View {
    @State private var isCamera = false
    @State private var isLibrary = false
    @State private var userImage: UIImage = UIImage()
    @EnvironmentObject var partialSheetManager : PartialSheetManager
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack (spacing:10) {
                    TextFieldRowView(name: "")
                    Button(action: {
                        self.partialSheetManager.showPartialSheet {
                            SourceTypeSelectView(isLibrary: $isLibrary, isCamera: $isCamera)
                        }
                    }) {
                        ImageRowView(ImageSelected: self.$userImage)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .fullScreenCover(isPresented: $isLibrary, content: {
                    ImagePicker(sourceType: .photoLibrary, partialSheetManager: _partialSheetManager, selectedImage: self.$userImage)
                })
                .fullScreenCover(isPresented: $isCamera, content: {
                    ImagePicker(sourceType: .camera, partialSheetManager: _partialSheetManager, selectedImage: self.$userImage)
                })
            }
            .navigationBarTitle("Examen - ios")
        }
        .addPartialSheet(style: .defaultStyle())
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
