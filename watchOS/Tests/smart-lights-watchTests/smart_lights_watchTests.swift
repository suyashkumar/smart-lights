import XCTest
@testable import smart_lights_watch

class smart_lights_watchTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(smart_lights_watch().text, "Hello, World!")
    }


    static var allTests : [(String, (smart_lights_watchTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
