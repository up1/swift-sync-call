import XCTest
@testable import DemoNetwork

class DemoNetworkWithUI: XCTestCase {
    
    let app = XCUIApplication()
    let postCount = "33"
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app.launchArguments += ["UI-TESTING"]
        app.launchEnvironment["http://masilotti.com/api/posts.json"] = "{\"posts\": \(postCount)}"
        app.launch()
    }
    
    func test_DisplaysPostCount() {
        let countLabel = app.staticTexts["\(postCount)"]
        XCTAssertTrue(countLabel.exists)
        waitForElementToAppear(countLabel)
    }
    
    private func waitForElementToAppear(element: XCUIElement, file: String = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)
        
        waitForExpectationsWithTimeout(5) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after 5 seconds."
                self.recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
            }
        }
    }

}
