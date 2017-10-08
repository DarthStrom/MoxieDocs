class ExampleClass {
    func foo() -> String {
        return "this is an example"
    }

    func foo(description: String) {
        // functionality
    }
}

protocol ExampleProtocol {
    func foo() -> String
}

struct ExampleStruct: ExampleProtocol {
    func foo() -> String {
        return "this is an example"
    }
}
