//
//  UserViewModel.swift
//  examen-ios
//
//  Created by Carlos Ponce on 26/11/21.
//

import Foundation
import UIKit
import SwiftUI

enum StorageType {
    case userDefaults, fileSystem
}

class UserViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var image: UIImage = UIImage()
    
    init() {
        self.name = self.getName()
        self.getImage { img in
            DispatchQueue.main.async {
                self.image = img
            }
        }
    }
    
    init(_ name: String,_ image: UIImage) {
        self.name = name
        self.image = image
    }
    
    func updateName(_ name: String) {
        self.name = name
        UserDefaults.standard.set(self.name, forKey: "name")
    }
    
    func removeName() {
        self.name = ""
        UserDefaults.standard.removeObject(forKey: "name")
    }
    
    private func getName() -> String {
        if let name = UserDefaults.standard.string(forKey: "name") {
            return name
        }
        print("No se encontraron resultados")
        return ""
    }
    
    private func filePath() -> URL? {
        let fileManager = FileManager.default
        guard let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return documentURL.appendingPathComponent("userImage.png")
    }
    
    private func store(image: UIImage, withStoreType storageType: StorageType) {
        if let pngRepresentation = image.pngData() {
            switch storageType {
            case .userDefaults:
                UserDefaults.standard.set(pngRepresentation, forKey: "userImage")
            case .fileSystem:
                if let filePath = self.filePath() {
                    do {
                        try pngRepresentation.write(to: filePath, options: .atomic)
                    }catch let err {
                        print("Se produjo un error al guardar: ", err)
                    }
                }
            }
        }
    }
    
    private func retrieveImage(inStorageType storageType: StorageType) -> UIImage? {
        switch storageType {
        case .userDefaults:
            if let imageData = UserDefaults.standard.object(forKey: "userImage") as? Data,
               let image = UIImage(data: imageData) {
                return image
            }
        case .fileSystem:
            if let filePath = self.filePath(),
               let fileData = FileManager.default.contents(atPath: filePath.path),
               let image = UIImage(data: fileData) {
                return image
            }
        }
        return nil
    }
    
    private func getImage(_ completion: @escaping(UIImage) -> Void) {
        DispatchQueue.global(qos: .background).async {
            if let saveImage = self.retrieveImage(inStorageType: .fileSystem) {
                DispatchQueue.main.async {
                    completion(saveImage)
                }
            }
            completion(UIImage(systemName: "person.fill") ?? UIImage())
        }
    }
    
    func updateImage(image: UIImage) {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.image = image
                self.store(image: self.image, withStoreType: .fileSystem)
            }
        }
    }
}
