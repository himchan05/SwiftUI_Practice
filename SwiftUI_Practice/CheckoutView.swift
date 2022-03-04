//
//  CheckoutView.swift
//  SwiftUI_Practice
//
//  Created by 박힘찬 on 2022/03/02.
//

import SwiftUI
struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    let paymentTypes = ["Cash", "Credit Card", "CPoint"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String { // 총 주문 금액 (팁 포함)
        let formatter = NumberFormatter() // formatter 객체
        formatter.numberStyle = .currency // formatter 스타일 : $
        
        let total = Double(order.total) // 총 주문 금액 가져오기
        let tipValue = total / 100 * Double(tipAmount) // 팁 가격 설정
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                //.pickerStyle(WheelPickerStyle())
                Toggle("Add CPoint loyalty card", isOn: $addLoyaltyDetails.animation()) // 토글 스위치 (애니메이션 효과 적용)
                if addLoyaltyDetails {
                    TextField("Enter your CPoint ID", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) { // 팁 선택 (바인딩)
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented) // 세그먼트 컨트롤 설정
            }
            Section(header: Text("TOTAL: \(totalPrice)").font(.largeTitle)) {
                Button("Confirm order") {
                    showingPaymentAlert.toggle() // showingPaymentAlert 활성화 
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline) // 적절한 크기/위치의 내비게이션 바 타이틀 지정
        .alert(isPresented: $showingPaymentAlert) { // showingPaymentAlert가 True이면 알림창 실행
            Alert(title: Text("Order confiremd"), message: Text("Your total was \(totalPrice) - Thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order()) // 미리보기 지원
    }
}
