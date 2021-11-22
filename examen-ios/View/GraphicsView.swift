//
//  GraphicsView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 22/11/21.
//

import SwiftUI

struct GraphicsView: View {
    
    @ObservedObject var viewModel: GraphicsViewModel
    
    var body: some View {
        List(viewModel.graphics.questions, id: \.self) { question in
            Text(question.text)
        }
        .onAppear {
            viewModel.fetchGraphics()
        }
        .navigationTitle("Gráficas")
    }
}
