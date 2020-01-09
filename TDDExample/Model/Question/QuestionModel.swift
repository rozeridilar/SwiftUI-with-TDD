//
//  QuestionModel.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/9/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import Foundation
struct QuestionModel: Codable{
    var question: String
    var questionNumber: Int
    var options: [String]
    var answer: String?
}
