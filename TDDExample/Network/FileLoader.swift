//
//  FileLoader.swift
//  TDDExample
//
//  Created by Rozeri Dilar on 1/9/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

//Example from: https://www.youtube.com/watch?v=amVstam84Xo
import Foundation

//Errors declared as -> Unified Error Output.
//Below enum indicates dedicated error type.
enum FileLoaderError: Error{
    case invalidFileName(String)
    case invalidFileURL(URL)
}

class FileLoader {
    private let cache: Cache<String, QuizModel>
    private let bundle: Bundle
    
    //Question: Why do we need dependency injection here?
    //Answer: So that we got rid of global values and make it easier for testing.
    init(cache: Cache<String, QuizModel> = .init(), bundle: Bundle = .main){
        self.cache = cache
        self.bundle = bundle
    }
    
    func file(named fileName: String) throws -> QuizModel{
        
        if let cachedFile = cache.value(forKey: QuizModel.KEY){
            return cachedFile
        }
        
        guard let url = bundle.url(forResource: fileName, withExtension: nil) else {
            throw FileLoaderError.invalidFileName(fileName)
        }
        
        do {
            let data = try Data(contentsOf: url)
            let quiz = try JSONDecoder().decode(QuizModel.self, from: data)
            cache.insert(quiz, forKey: QuizModel.KEY)
            return quiz
        } catch {
            throw FileLoaderError.invalidFileURL(url)
        }
    }
    
}



//Design your code for testability:
//Key factores in designing your code,
//First, Unified input/Output.
//Second, Always keep our state local.
//Third and final important one: Dependency Injection.
