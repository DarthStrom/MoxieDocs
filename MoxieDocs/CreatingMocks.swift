class ExampleClass {
    func foo() -> String {
        return "this is an example"
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
