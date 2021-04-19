//
//  DemoTests.swift
//  DemoTests
//
//  Created by Rommy Fuentes Davila Otani on 16/04/21.
//

import XCTest
@testable import Demo

class DemoTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() {
        let service = LoginService()
        service.login(user: "Admin", password:"Password*123") { (response) in
            XCTAssertTrue(response.success)
        } failure: { (error) in
            XCTFail()
        }
    }

    func testListMovie() {
        let service = MovieService()
        service.listMovie(page: 1) { (response) in
            XCTAssertTrue(response.results.count > 0)
        } failure: { (error) in
            XCTFail()
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
