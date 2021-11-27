//
//  ImagePicker.swift
//  examen-ios
//
//  Created by Carlos Ponce on 21/11/21.
//

import SwiftUI
import UIKit
import PartialSheet

struct ImagePicker:UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    @ObservedObject var viewModel: UserViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        
        return imagePicker
    }
     
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ObservableObject {
     
        var parent: ImagePicker
     
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.viewModel.updateImage(image: image)
            }
            parent.partialSheetManager.closePartialSheet()
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


