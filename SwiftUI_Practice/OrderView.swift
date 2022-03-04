//
//  OrderView.swift
//  SwiftUI_Practice
//
//  Created by 박힘찬 on 2022/03/02.
//

import SwiftUI
struct OrderView: View {
    @EnvironmentObject var order: Order // 전역
   
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
                            .font(.system(size: 30, weight: .bold))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:  100)
                            .foregroundStyle(Color.white)
                        Spacer()
                    }
                    .disabled(order.items.isEmpty) // 주문 건이 없다면 주문 화면 비활성
                }
                .background(order.items.isEmpty ? Color.red : Color.black)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:  100)
                .cornerRadius(15)
                .edgesIgnoringSafeArea(.all)
            }
            .navigationTitle("Order")
            .listStyle(.insetGrouped) // 그룹화 스타일 지정
        }
    }
    func deleteItems(at offsets: IndexSet) { // 선택된 아이템을 제거할 메소드
        order.add(rm_item: order.items[0])
        order.items.remove(atOffsets: offsets)
    }

}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}

