//
//  PieChartView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 22/11/21.
//

import SwiftUI

struct PieChartView: View {
    var sizes: [Double]
    let colors: [Color]
    let angleOffset = 90.0
    
    var body: some View {
        let total = sizes.reduce(0, +)
        let angles = sizes.map { $0 * 360.0 / total }
        var sum = 0.0
        let runningAngles = angles.map { (sum += $0, sum).1 }
        ZStack{
            GeometryReader { geo in
                ForEach(0..<runningAngles.count) { i in
                    let startAngle = i == 0 ? 0.0 : runningAngles[i - 1]
                    Sector(startAngle: Angle(degrees: startAngle - angleOffset), endAngle:Angle(degrees: runningAngles[i] - angleOffset))
                        .fill(colors[i%colors.count])
                }
                Circle()
                    .fill(Color("normalColor"))
                    .padding(geo.size.height*0.10)
            }
        }
    }
}


struct Sector: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        // centre of the containing rect
        let c = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        // radius of a circle that will fit in the rect
        let r = Double(min(rect.width,rect.height)) * 0.9 / 2.0
        var path = Path()
        path.move(to: c)
        path.addArc(center: c,
                    radius: CGFloat(r),
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: false
        )
        path.closeSubpath()
        return path
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(sizes: [30,15, 15, 25, 10, 5], colors: [.red, .yellow, .blue, .brown, .green, .cyan])
            .preferredColorScheme(.light)
    }
}

