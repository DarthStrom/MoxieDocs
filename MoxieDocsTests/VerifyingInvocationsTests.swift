import Moxie
import XCTest
@testable import MoxieDocs

class VerifyingInvocationsTests: XCTestCase {
    
    let mock = MockExampleClass()

    func testFooWasNotCalled() {
        XCTAssertFalse(mock.invoked(function: "foo"))
    }

    func testFooWasCalled() {
        mock.foo(description: "updated")
        mock.foo(description: "updated")

        XCTAssertTrue(mock.invoked(function: "foo"))
        XCTAssertEqual("updated", mock.parameters(forFunction: "foo")[0] as? String)
    }

    func testFooWasCalledThreeTimes() {
        mock.foo(description: "once")
        mock.foo(description: "twice")
        mock.foo(description: "thrice")

        XCTAssertEqual(3, mock.invocations(forFunction: "foo"))
        XCTAssertEqual("once", mock.parameters(forFunction: "foo")[0] as? String)
        XCTAssertEqual("twice", mock.parameters(forFunction: "foo", invocation: 2)[0] as? String)
        XCTAssertEqual("thrice", mock.parameters(forFunction: "foo", invocation: 3)[0] as? String)
    }
}
