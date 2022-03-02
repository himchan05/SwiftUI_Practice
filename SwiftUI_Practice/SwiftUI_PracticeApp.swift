//
//  SwiftUI_PracticeApp.swift
//  SwiftUI_Practice
//
//  Created by 박힘찬 on 2022/03/02.
//

import SwiftUI
@main
struct SwiftUI_PracticeApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
