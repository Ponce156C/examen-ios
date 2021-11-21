//
//  graphic.swift
//  examen-ios
//
//  Created by Carlos Ponce on 20/11/21.
//

import Foundation

// MARK: - Welcome
struct graphic: Codable {
    let colors: [String]
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let total: Int
    let text: String
    let chartData: [ChartDatum]
}

// MARK: - ChartDatum
struct ChartDatum: Codable {
    let text: String
    let percetnage: Int
}
