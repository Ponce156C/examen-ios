//
//  graphic.swift
//  examen-ios
//
//  Created by Carlos Ponce on 20/11/21.
//

import Foundation

// MARK: - Welcome
struct graphic: Decodable {
    let colors: [String]
    let questions: [Question]
}

// MARK: - Question
struct Question: Decodable, Hashable {
    let total: Int
    let text: String
    let chartData: [ChartDatum]
}

// MARK: - ChartDatum
struct ChartDatum: Decodable, Hashable {
    let text: String
    let percetnage: Int
}
