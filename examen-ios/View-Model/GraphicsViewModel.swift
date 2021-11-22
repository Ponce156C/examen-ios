//
//  GraphicsViewModel.swift
//  examen-ios
//
//  Created by Carlos Ponce on 21/11/21.
//

import Foundation
import SwiftUI

class GraphicsViewModel: ObservableObject
{
    let url:URL! = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")

    @Published var graphics = graphic(colors: [String](), questions: [Question]())

    init() {
        fetchGraphics()
    }

    func fetchGraphics() {
//        URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
//            if error == nil {
//                do {
//                    let json = try JSONDecoder().decode([graphic].self, from: data!)
//                    print(json)
//                    graphics = self.graphics
//                }
//                catch {
//                    print(error)
//                }
//            }
//        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: graphic.self, decoder: JSONDecoder())
            .replaceError(with: graphic(colors: [String](), questions: [Question]()))
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: &$graphics)
    }
}
