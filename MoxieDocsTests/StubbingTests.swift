import Moxie
import XCTest
@testable import MoxieDocs

class MockExampleClass: ExampleProtocol, Mock {
    var moxie = Moxie()

    func foo() -> String {
        return value(forFunction: "foo") ?? ""
    }

    func foo(description: String) {
        record(function: "foo", wasCalledWith: [description])
    }
}

class StubbingTests: XCTestCase {

    let mock = MockExampleClass()

    func testItWorks() {
        mock.stub(function: "foo", return: "this is a different example")

        XCTAssertEqual("this is a different example", mock.foo())
    }
}
