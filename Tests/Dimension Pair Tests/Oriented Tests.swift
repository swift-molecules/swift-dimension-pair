import Dimension
import Dimension_Direction
import Dimension_Pair
import Pair
import Testing

@Suite("Dimension Orientation × Pair")
struct Oriented_Tests {

    struct Payload: ~Copyable {
        let value: Int
    }

    @Test
    func `orientation Value pairs the orientation with its payload`() {
        let value: Vertical.Value<Double> = Pair(.upward, 1.5)

        #expect(value.first == .upward)
        #expect(value.second == 1.5)
    }

    @Test
    func `dimension pair aliases accept noncopyable payloads`() {
        let value: Chirality.Value<Payload> = Pair(.right, Payload(value: 42))
        let matches = value.apply { chirality, payload in
            chirality == .right && payload.value == 42
        }

        #expect(matches)
    }
}
