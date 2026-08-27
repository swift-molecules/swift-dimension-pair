import Dimension
import Dimension_Pair
import Pair
import Testing

@Suite
struct `Chirality - Value Typealias` {
    @Test
    func `Value typealias for Pair`() {
        let paired: Chirality.Value<String> = Pair(.left, "hand")
        #expect(paired.first == .left)
        #expect(paired.second == "hand")
    }

    @Test
    func `Value is Pair type`() {
        let value: Chirality.Value<Int> = Pair(.right, 42)
        #expect(value.first == .right)
        #expect(value.second == 42)
    }
}
