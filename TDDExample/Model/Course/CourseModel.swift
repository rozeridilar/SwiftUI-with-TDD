//
//  CourseModel.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/9/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import Foundation
struct CourseModel: Codable{
    var courseName: String
    var questions: [QuestionModel]
}
