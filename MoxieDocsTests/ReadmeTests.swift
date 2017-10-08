import XCTest
import Moxie
@testable import MoxieDocs

struct MockList: Mock, List {
    var moxie = Moxie()

    mutating func add(_ item: String) {
        record(function: "add", wasCalledWith: [item])
    }

    mutating func clear() {
        record(function: "clear")
    }

    func get(_ index: Int) -> String? {
        return value(forFunction: "get")
    }
}

class ReadmeTests: XCTestCase {

    func testList() {

        var mockList = MockList()

        // verifying invocations
        mockList.add("one")
        mockList.clear()

        XCTAssertTrue(mockList.invoked(function: "add"))
        XCTAssertEqual("one", mockList.parameters(forFunction: "add")[0] as? String)
        XCTAssertTrue(mockList.invoked(function: "clear"))

        // stubbing
        mockList.stub(function: "get", return: "first")

        XCTAssertEqual("first", mockList.get(0))
    }
}
