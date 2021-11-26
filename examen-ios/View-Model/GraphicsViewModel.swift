//
//  GraphicsViewModel.swift
//  examen-ios
//
//  Created by Carlos Ponce on 21/11/21.
//

import Foundation
import SwiftUI

class GraphicsViewModel: ObservableObject {
    let url:URL! = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")
//    @Published var isLoad : Bool = false
    @Published var graphics = graphic(colors: [String](), questions: [Question]())

    init() {
        self.fetchGraphics()
    }
    
    func fetchGraphics() {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: graphic.self, decoder: JSONDecoder())
            .replaceError(with: graphic(colors: [String](), questions: [Question]()))
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: &$graphics)
    }
    
    func getGraphics() -> graphic {
        return self.graphics
    }
    
    func cancelDataTask() {
        URLSession.shared.invalidateAndCancel()
    }
}
