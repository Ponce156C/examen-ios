//
//  UserViewModel.swift
//  examen-ios
//
//  Created by Carlos Ponce on 26/11/21.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var name: String = ""
    
    init() {
        self.name = getName()
    }
    
    init(name: String) {
        self.name = name
    }
    
    func updateName(_ name: String) {
        self.name = name
        UserDefaults.standard.set(self.name, forKey: "name")
    }
    
    func removeName() {
        self.name = ""
        UserDefaults.standard.removeObject(forKey: "name")
    }
    
    func getName() -> String {
        if let name = UserDefaults.standard.string(forKey: "name") {
            return name
        }
        print("No se encontraron resultados")
        return ""
    }
    
    
}
