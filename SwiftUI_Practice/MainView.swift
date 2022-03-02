//
//  MainView.swift
//  SwiftUI_Practice
//
//  Created by 박힘찬 on 2022/03/02.
//

import SwiftUI
struct MainView: View {
    var body: some View {
        TabView {
            ContentView() // 컨텐트 뷰 호출
                .tabItem { // 탭 바 아이템 1)
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView() // 오더 뷰 호출
                .tabItem { // 탭 바 아이템 2)
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(Order()) // 오더 뷰가 작동할 수 있도록.
    }
}
