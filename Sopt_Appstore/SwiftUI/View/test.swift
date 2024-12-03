//
//  test.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct ThreeRowGridView: View {
    // 더미 데이터
    let items = Array(1...9).map { "Item \($0)" }

    // 그리드 레이아웃: 3열 설정
    let columns = [
        GridItem(.flexible())
        
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items, id: \.self) { item in
                    // 각 셀의 디자인
                    Text(item)
                        .frame(height: 100)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ThreeRowGridView()
}
