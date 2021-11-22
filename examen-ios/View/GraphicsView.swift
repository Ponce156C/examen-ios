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
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 2), alignment: .leading, spacing: 0) {
                ForEach(question.chartData.indices) { i in
                    let chartDatum = question.chartData[i]
                    HStack(alignment:.top) {
                        Text("")
                            .frame(width: 10, height: 10)
                            .background(Color(hex: viewModel.graphics.colors[i]))
                            .cornerRadius(5)
                            .offset(x: 0, y: 3)
                        Text(chartDatum.text)
                            .font(.system(size: 12))
                        Text("\(chartDatum.percetnage)%")
                            .font(.system(size: 12))
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchGraphics()
        }
        .navigationTitle("Gráficas")
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
