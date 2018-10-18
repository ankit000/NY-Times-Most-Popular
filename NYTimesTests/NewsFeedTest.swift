//
//  NewsFeedTest.swift
//  NYTimes
//
//  Created by Ankit katiyar on 17/10/18.
//

import XCTest
import Alamofire
class NewsFeedTest: XCTestCase {
    
    let timeout: TimeInterval = 30.0
    let urlString = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/15.json?api-key=a2e2ec79bb2d4860b2c80d0352dedd96"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testThatResponseReturnsSuccessResultWithValidData() {
        // Given
        let urlString = self.urlString
        let expectation = self.expectation(description: "request should succeed")
        
        var response: DefaultDataResponse?
        
        // When
        Alamofire.request(urlString, parameters: nil).response { resp in
            response = resp
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        // Then
        XCTAssertNotNil(response?.request)
        XCTAssertNotNil(response?.response)
        XCTAssertNotNil(response?.data)
        XCTAssertNil(response?.error)
        
        if #available(iOS 10.0, macOS 10.12, tvOS 10.0, *) {
            XCTAssertNotNil(response?.metrics)
        }
    }
    
    func testThatResponseReturnsFailureResultWithOptionalDataAndError() {
        // Given
        let urlString = self.urlString
        let expectation = self.expectation(description: "request should fail with 404")
        
        var response: DefaultDataResponse?
        
        // When
        Alamofire.request(urlString, parameters: nil).response { resp in
            response = resp
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        // Then
        XCTAssertNotNil(response?.request)
        XCTAssertNil(response?.response)
        XCTAssertNotNil(response?.data)
        XCTAssertNotNil(response?.error)
        
        if #available(iOS 10.0, macOS 10.12, tvOS 10.0, *) {
            XCTAssertNotNil(response?.metrics)
        }
    }
    
    func testThatResponseJSONReturnsSuccessResultWithValidJSON() {
        // Given
        let urlString = self.urlString
        let expectation = self.expectation(description: "request should succeed")
        
        var response: DataResponse<Any>?
        
        // When
        Alamofire.request(urlString, parameters: nil).responseJSON { resp in
            response = resp
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeout, handler: nil)
        
        // Then
        XCTAssertNotNil(response?.request)
        XCTAssertNotNil(response?.response)
        XCTAssertNotNil(response?.data)
        XCTAssertNotNil(response?.data)
        XCTAssertEqual(response?.result.isSuccess, true)
        
        if #available(iOS 10.0, macOS 10.12, tvOS 10.0, *) {
            XCTAssertNotNil(response?.metrics)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
