# NY-Times-Most-Popular

It is a simple app to hit the NY Times Most Popular Articles API and show a list of articles,
that shows details



## Requirements

- iOS 8.0+ | macOS 10.10+ | tvOS 9.0+ | watchOS 2.0+
- Xcode 8

## Integration

#### CocoaPods (iOS 8+, OS X 10.9+)

You can use [CocoaPods](http://cocoapods.org/) and just do 'pod install' from terminal
and after that just launch the app by clicking 'NYTimes.xcworkspace'

Here is the details of pod files used in NYTimes

```ruby
platform :ios, '8.0'
use_frameworks!

target 'NYTimes' do
    pod 'Alamofire'
    pod 'SwiftyJSON'
end
```

## Unit Test 

'NewsFeedTest' class contains the test cases for api request and response

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
    
## Code Coverage

- To measure and visualize code coverage for a project, follow these steps:
Enable code coverage date gathering. To do this, go to Product › Scheme › Edit Scheme... , and select Test from the left hand side menu. Under the Info section, check the Gather coverage data box.

- To run all unit tests for a test target, in this case BikeProvider, first open the Test navigator in Xcode’s navigation pane. Then, select the small Run button next to your test target name.

- Now open the Report navigator in Xcode’s navigation pane, and select the Test report from the list. This should open up a list of the tests that were just run and indicate which passed and failed. In this case, they all passed.

- To view code coverage, select the Coverage tab. Xcode will display the overall code coverage for the framework, and we can expand this to get coverage data on individual files and functions.
