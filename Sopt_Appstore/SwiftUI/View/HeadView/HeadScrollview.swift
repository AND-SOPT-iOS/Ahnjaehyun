//
//  HeadScrollview.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct HeadScrollView_SwiftUI: View {
    @ObservedObject var viewModel: HeadScrollViewViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(viewModel.rows) { row in
                    HeadHorizenScrollViewRow(
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
                }
            }
            .padding(.horizontal, 15)
        }
    }
}
