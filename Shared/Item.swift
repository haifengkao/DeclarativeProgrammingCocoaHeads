//
//  Item.swift
//  DeclarativeProgrammingCocoaHeads
//
//  Created by Lono on 2021/12/9.
//

import Foundation

protocol Item {
    var name: String { get }
    var price: Int { get }
}

extension Weapon: Item {}

extension Armor: Item {}
