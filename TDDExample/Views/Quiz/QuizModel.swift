//
//  QuizModel.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/14/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import Foundation

/// We must implement hash and isEqual — since that’s how to determine whether two instances are equal.
/// Apple defines hashable as a type that provides an integer a hash value which is provided by a type’s hashValue property
/// and it is basically an integer that is the same for any two instances that compare equally.
/// In a nutshell, a hashable is a type that has hashValue in the form of an integer that can be compared across different types.

struct QuizModel: Codable, Hashable, Identifiable{
    static let KEY = "QuizModel"
    var id: Int
    var courses: [CourseModel]
    func hash(into hasher: inout Hasher) {
        hasher.combine(id.hashValue)
    }
    
    static func == (lhs: QuizModel, rhs: QuizModel) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }
}
