//
//  GraphicsView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 22/11/21.
//

import SwiftUI

struct GraphicsView: View {
    
    @ObservedObject var viewModel: GraphicsViewModel
    @State var names = [String]()
    
    var body: some View {
        ZStack {
            List(viewModel.graphics.questions, id: \.self) { question in
                VStack(alignment: .leading) {
    //              MARK: Title
                    Text(question.text)
                        .padding(5)
                        .frame(minWidth:300, alignment: .leading)
    //              MARK: Pie chart
                    let colorsArray = viewModel.graphics.colors.map { Color(hex:$0) }
                    let sectorArray: [Double] = question.chartData.map { Double($0.percetnage) }
                    PieChartView(sizes: sectorArray, colors: colorsArray)
                        .frame(height: 200, alignment: .center)
    //              MARK: Options
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 2), alignment: .leading , spacing: 0) {
                        ForEach(question.chartData.indices) { i in
                            let chartDatum = question.chartData[i]
                            HStack(alignment:.top) {
                                Circle()
                                    .fill(colorsArray[i])
                                    .frame(width: 10, height: 10)
                                    .offset(x: 0, y: 3)
                                Text("\(chartDatum.text.capitalized) \(chartDatum.percetnage)%")
                                    .font(.system(size: 12))
                            }
                        }
                    }.padding(.horizontal, 10)
                }
            }
//            ProgressView {
//                Button {
//                    viewModel.cancelDataTask()
//                } label: {
//                    Text("Cancel download")
//                        .foregroundColor(.white)
//                }
//                .padding(8)
//                .background(Color.red)
//                .cornerRadius(5)
//            }
        }
        .navigationTitle("Gráficas")
    }
}

struct GraphicsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = GraphicsViewModel()
        GraphicsView(viewModel: viewModel)
            .preferredColorScheme(.light)
    }
}
