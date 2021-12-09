import UIKit

struct Point {
    let x: Float
    let y: Float
}

let p1: Point = .init(x: 1.0, y: 2.0)
let p2: Point = .init(x: 3.0, y: 4.0)

let sum: Point = .init(x: p1.x + p2.x,
                       y: p1.y + p2.y)

print("sum:", sum.x, sum.y)

struct ComposedPoint {
    let points: [Point]

    var x: Float { points.map(\.x).reduce(0.0, +) }
    var y: Float { points.map(\.y).reduce(0.0, +) }
}

let sum2 = ComposedPoint(points: [p1, p2])
print("sum2:", sum2.x, sum2.y)
