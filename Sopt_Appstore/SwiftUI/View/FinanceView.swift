//
//  FinanceView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct FinanceView: View {
    
    @StateObject private var tabviewViewModel = HeadTabviewViewViewModel()
    @StateObject private var appViewModel = SwiftUIAppViewModel()

    let appList = App.mockData

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    HeadTabView(viewModel: tabviewViewModel)
                    
                    AppSectionBoxView(headerTitle: "필수 금융 앱",headerDescript: "App Store 에디터가 직접 골랐습니다", apps: appList)
                        .frame(height: 310)

                    AppSectionBoxView(headerTitle: "유료 순위",headerDescript: "App Store 에디터가 직접 골랐습니다", apps: appList)
                        .frame(height: 310)

                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationTitle("금융")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color(red: 22/255, green: 22/255, blue: 24/255).opacity(0.95), for: .navigationBar)
        }
    }
}


#Preview {
    FinanceView()
}
