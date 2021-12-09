import UIKit

struct Point {
    var x: Float
    var y: Float
}

let p1: Point = .init(x: 1.0, y: 2.0)
let p2: Point = .init(x: 3.0, y: 4.0)
let p3: Point = .init(x: 5.0, y: 6.0)

var sum: Point = .init(x: 0.0, y: 0.0)
for p in [p1, p2, p3] {
    sum.x += p.x
    sum.y += p.y
}

print("sum:", sum.x, sum.y)

struct ComposedPoint {
    let points: [Point]

    var x: Float { points.map(\.x).reduce(0.0, +) }
    var y: Float { points.map(\.y).reduce(0.0, +) }
}

let sum2 = ComposedPoint(points: [p1, p2, p3])
print("sum2:", sum2.x, sum2.y)
