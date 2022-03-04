//
//  RemoveItemView.swift
//  SwiftUI_Practice
//
//  Created by 박힘찬 on 2022/03/04.
//

import SwiftUI

struct RemoveItemView: View {
    @EnvironmentObject var order: Order // 전역
    
    var isEditing = false
    var selection = Set<String>()
    var names = ["Karl", "hans", "himchan"]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.rm_items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                Section {
                    Text("취소 섹션")
                        .font(.system(size: 30))
                        .onTapGesture {
                            print("취소 섹션이 클릭되었다.")
                        }
                }
            }
            .navigationTitle("Remove Item")
            .listStyle(.insetGrouped)
        }

    }
}

struct RemoveItemView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveItemView().environmentObject(Order())
    }
}
