//: [Previous](@previous)

struct Weapon {
    let name: String
    let damage: Float
    let price: Int
}

extension Array where Element == Weapon {
    static let fake: Self = [
        .init(name: "木棒", damage: 6.0, price: 1),
        .init(name: "匕首", damage: 3.0, price: 2),
        .init(name: "短劍", damage: 20.0, price: 40),
        .init(name: "飛鏢", damage: 3.0, price: 5),
        .init(name: "短弓", damage: 10.0, price: 20),
        .init(name: "大火箭", damage: 200.0, price: 10000),
    ]
}

struct Armor {
    let name: String
    let defense: Float
    let price: Int
}

extension Array where Element == Armor {
    static let fake: Self = [
        .init(name: "皮甲", defense: 11.0, price: 10),
        .init(name: "鑲釘皮甲", defense: 12.0, price: 45),
        .init(name: "鱗甲", defense: 14.0, price: 50),
        .init(name: "鎖子甲", defense: 16.0, price: 75),
        .init(name: "全身板甲", defense: 18.0, price: 1500),
        .init(name: "盾牌", defense: 2.0, price: 10),
    ]
}

protocol Item {
    var name: String { get }
    var price: Int { get }
}

extension Weapon: Item, Equatable {}

extension Armor: Item, Equatable {}

let weapons: [Weapon] = .fake
let armors: [Armor] = .fake

let items1: [Item] = weapons
let items2: [Item] = armors

struct AnyItem {
    private let item: Item

    private let isEqualTo: (Item) -> Bool

    init<A: Equatable & Item>(item: A) {
        self.item = item
        isEqualTo = { other in
            guard let o = other as? A else { return false }
            return item == o
        }
    }
}

extension AnyItem: Item {
    var name: String {
        item.name
    }

    var price: Int {
        item.price
    }
}

extension AnyItem: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.isEqualTo(rhs.item)
    }
}

extension Item where Self: Equatable {
    func erasedToAnyItem() -> AnyItem {
        AnyItem(item: self)
    }
}

let anyItems1: [AnyItem] = weapons.map { $0.erasedToAnyItem() }
let anyItems2: [AnyItem] = armors.map { $0.erasedToAnyItem() }

print("isEqual:", anyItems1 == anyItems2)

//: [Next](@next)
