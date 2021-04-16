//
//  MovieListTests.swift
//  MovieListTests
//
//  Created by Manikandan on 6/4/21.
//

import XCTest
@testable import MovieList

class MovieListTests: XCTestCase {
    
    var controller: ViewController = ViewController()
    var window: UIWindow!
    var Mov: ViewController!
    var MovDet: MovieDetailsViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        window = UIWindow()
        Mov = (storyboard.instantiateViewController(withIdentifier: "MainViewController") as! ViewController)
       
        
        MovDet = storyboard.instantiateViewController(withIdentifier: "movieDetailsS") as? MovieDetailsViewController
        MovDet.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        MovDet = nil
       
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        controller.getDataFromJSON()
        
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
