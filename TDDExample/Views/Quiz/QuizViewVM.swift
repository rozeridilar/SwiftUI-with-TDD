//
//  QuizViewVM.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/14/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import Foundation

let quiz: QuizModel = loadQuizData()

func loadQuizData<T: Decodable>() -> T {
    let data: QuizModel
    let cache = Cache<String, QuizModel>()
    let quizTestFileName = "QuizTest.json"
    
    
    guard Bundle.main.url(forResource: quizTestFileName, withExtension: nil) != nil
        else {
            fatalError("Couldn't find \(quizTestFileName) in main bundle.")
    }
    
    let loader = FileLoader(cache: cache, bundle: Bundle.main)
    
    do {
        data = try loader.file(named: quizTestFileName)
        return data as! T
    } catch {
        fatalError("Couldn't load \(quizTestFileName) from main bundle:\n\(error)")
    }
}

class QuizViewVM: ObservableObject {
    
    @Published var quiz: QuizModel?
    
    func start() {
        quiz = QuizModel(id: 0, courses: [CourseModel(courseName: "some", questions: [QuestionModel(question: "some question", id: 1, options: ["some options"], answer: "1")])])
        fetchData()
    }
    
    func fetchData() {
       
    }
}
