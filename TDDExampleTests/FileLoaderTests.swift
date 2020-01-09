//
//  FileLoaderTests.swift
//  TDDExampleTests
//
//  Created by Rozeri Dilar on 1/9/20.
//  Copyright © 2020 Rozeri Dilar. All rights reserved.
//

import XCTest
@testable import TDDExample

class FileLoaderTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testLoadingAndCaching(){
        let cache = Cache<String, QuizModel>()
        let bundle = Bundle(for: type(of: self))
        let loader = FileLoader(cache: cache, bundle: bundle)
        let quizTestFileName = "QuizTest.json"
        do{
            let file = try loader.file(named: quizTestFileName)
            XCTAssertNotNil(file)
            XCTAssertEqual(file, cache.value(forKey: QuizModel.KEY))
        }catch{
            XCTFail()
        }
    }

    func testPerformanceExample() {
        self.measure {
            testLoadingAndCaching()
        }
    }

}
