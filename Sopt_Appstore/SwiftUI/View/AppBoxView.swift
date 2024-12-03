//
//  AppBoxView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI



struct AppSectionBoxView: View {
    let headerTitle: String
    let apps: [App]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(headerTitle)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.horizontal)

            ForEach(apps) { app in
                AppRow(app: app)
            }
        }
    }
}
