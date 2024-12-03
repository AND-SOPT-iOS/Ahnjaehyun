//
//  HeadScrollview.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct HeadTabView: View {
    @ObservedObject var viewModel: HeadScrollViewViewModel
    
    var body: some View {
        TabView {
            ForEach(viewModel.rows) { row in
                HeadTabViewRow(
                    title: row.title,
                    subtitle: row.subtitle,
                    overlayTitle: row.overlayTitle,
                    overlaySubtitle: row.overlaySubtitle,
                    buttonText: row.buttonText,
                    purchaseText: row.purchaseText,
                    backgroundImage: row.backgroundImage,
                    overlayIcon: row.overlayIcon
                )
                .frame(width: UIScreen.main.bounds.width - 30)
                .padding(.horizontal, 15)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // 페이징 스타일 설정
        .frame(height: 300) // 높이 지정
    }
}

