//
//  ContentView.swift
//  Shared
//
//  Created by Lono on 2021/12/9.
//

import SwiftUI

struct ContentView: View {
    enum Mode {
        case weapon
        case armor
    }

    @State var mode: Mode = .weapon

    private let weapons: [Weapon] = .fake
    private let armors: [Armor] = .fake

    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            HStack {
                Spacer()
                Button {
                    mode = .weapon
                } label: {
                    Text("武器").font(.title)
                }
                Spacer()
                Button {
                    mode = .armor
                } label: {
                    Text("防具").font(.title)
                }
                Spacer()
            }
            List {
                HStack {
                    Text("商品")
                    Spacer()
                    Text("價錢")
                }.listRowBackground(Color(.init(gray: 1.0, alpha: 0.4)))

                switch mode {
                case .weapon:
                    ForEach(weapons, id: \.name) { weapon in
                        HStack {
                            Text("\(weapon.name)")
                            Spacer()
                            Text("\(weapon.price)")
                        }
                    }.listRowBackground(Color.clear)
                case .armor:
                    ForEach(armors, id: \.name) { armor in
                        HStack {
                            Text("\(armor.name)")
                            Spacer()
                            Text("\(armor.price)")
                        }
                    }.listRowBackground(Color.clear)
                }
            }
        }
        .background(Image("shop").resizable().aspectRatio(contentMode: .fill).opacity(0.5))
        .onAppear {
            // Set the default to clear
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear

            print("appear")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
