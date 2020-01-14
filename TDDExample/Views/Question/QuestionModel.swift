//
//  QuestionModel.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/14/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import Foundation
struct QuestionModel: Codable, Identifiable{
    var question: String
    var id: Int
    var options: [String]
    var answer: String?
}
