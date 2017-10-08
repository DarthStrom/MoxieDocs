protocol List {
    mutating func add(_ item: String)
    mutating func clear()

    func get(_ index: Int) -> String?
}
