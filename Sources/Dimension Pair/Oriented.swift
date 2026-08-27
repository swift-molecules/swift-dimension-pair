public import Dimension_Direction
public import Pair

public typealias Oriented<O: Orientation, Scalar> = Pair<O, Scalar>

extension Orientation {

    public typealias Value<Scalar> = Oriented<Self, Scalar>
}
