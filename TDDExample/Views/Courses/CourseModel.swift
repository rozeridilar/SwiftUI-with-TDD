//
//  CourseModel.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/14/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import Foundation

public struct CourseModel: Codable{
    var courseName: String
    var questions: [QuestionModel]
}
