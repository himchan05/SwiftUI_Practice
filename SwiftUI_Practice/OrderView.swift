//
//  OrderView.swift
//  SwiftUI_Practice
//
//  Created by 박힘찬 on 2022/03/02.
//

import SwiftUI
struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                Section {
                    NavigationLink(destination: CheckoutView()) { // 주문화면
                        Spacer()
                        Text("Place Order")
                            .font(.system(size: 15, weight: .semibold))
                            .background(Color.blue)
                            .foregroundStyle(Color.red)
                        Spacer()
                    }
                    .disabled(order.items.isEmpty) // 주문 건이 없다면 주문 화면 비활성화
                }
                .navigationTitle("Order")
                .listStyle(.insetGrouped) // 그룹화 스타일 지정
                .toolbar {
                    //EditButton() // 편집 버튼 추가
                }
            }
        }
    }
    func deleteItems(at offsets: IndexSet) { // 선택된 아이템을 제거할 메소드
        order.items.remove(atOffsets: offsets)
    }

}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}

