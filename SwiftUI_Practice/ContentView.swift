//
//  ContentView.swift
//  SwiftUI_Practice
//
//  Created by 박힘찬 on 2022/03/02.
//

import SwiftUI
struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)) { // 상세 화면
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu") // 내비게이션 타이틀
            .listStyle(.grouped) // 화면에 꽉차게
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

