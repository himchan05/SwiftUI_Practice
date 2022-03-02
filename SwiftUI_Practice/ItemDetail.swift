//
//  ItemDetail.swift
//  SwiftUI_Practice
//
//  Created by 박힘찬 on 2022/03/02.
//

import SwiftUI
struct ItemDetail: View {
    @EnvironmentObject var order: Order
    let item: MenuItem
    
    var body: some View {
        VStack { // 수직 스택
            ZStack(alignment: .bottomTrailing) { // Z 스택 ( 겹치는 뷰 처리)
                Image(item.mainImage) // 메인 이미지
                    .resizable() // 이미지 크기 조절
                    .scaledToFit() // 사용 공간에 맞게 크기 조절 
                Text("Photo: \(item.photoCredit)")
                    .padding(4) // 패딩 적용
                    .background(Color.black) // 배경 색상
                    .font(.caption) // 폰트 적용
                    .foregroundColor(.white) // 글꼴 색상
            }
            Text(item.description) // 설명
                .padding() // 패딩 적용
            Button("Order This") {
                order.add(item: item)
            }
            .font(.headline)
            Spacer() // 상단 정렬
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline) // 내비게이션 바 타이틀 스타일 수정
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // 내비게이션 바 타이틀이 보이도록
            ItemDetail(item: MenuItem.example).environmentObject(Order()) // 예제 화면을 사용하려면 미리보기 코드를 업데이트해야 한다.
        }
    }
}
