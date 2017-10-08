import Moxie
import XCTest
@testable import MoxieDocs

class MockClass: ExampleClass, Mock {
    var moxie = Moxie()

    override func foo() -> String {
        return "this is a different example"
    }
}

struct MockExampleStruct: ExampleProtocol, Mock {
    var moxie = Moxie()

    func foo() -> String {
        return "this is a different example"
    }
}

class CreatingMocksTests: XCTestCase {
    
    func testItCompiles() {
        XCTAssertNotNil(MockClass())
        XCTAssertNotNil(MockExampleStruct())
    }
}
