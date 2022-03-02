//
//  ItemRow.swift
//  SwiftUI_Practice
//
//  Created by 박힘찬 on 2022/03/02.
//

import SwiftUI
struct ItemRow: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var body: some View {
        HStack { // 수평 컨테이너
            Image(item.thumbnailImage)
                .clipShape(Circle()) // 이미지를 원형으로
                .overlay(Circle().stroke(Color.gray, lineWidth: 2)) // 회색 테두리로 감싼다.
            VStack(alignment: .leading) { // 수직 컨테이너 왼쪽 정렬 
                Text(item.name).font(.headline) // 폰트 변경
                Text(String("$\(item.price)"))
            }
            Spacer() // 강제 공간 분리 
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption) // 폰트 변경
                    .fontWeight(.black) // 굵기 설정
                    .padding(5)
                    .background(colors[restriction, default: .black]) // 배경 색상
                    .clipShape(Circle()) // 원형
                    .foregroundColor(.white) // 글꼴 색상
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
