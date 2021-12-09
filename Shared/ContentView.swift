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
            HStack {
                Spacer()
                Button {
                    mode = .weapon
                } label: {
                    Text("武器")
                }
                Spacer()
                Button {
                    mode = .armor
                } label: {
                    Text("防具")
                }
                Spacer()
            }
            List {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}