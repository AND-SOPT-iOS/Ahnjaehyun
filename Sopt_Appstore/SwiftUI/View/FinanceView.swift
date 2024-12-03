//
//  FinanceView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct FinanceView: View {
    
    
    @ObservedObject var viewModel: HeadScrollViewViewModel

    
    let appList = App.mockData

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                   
                    
                    AppSectionBoxView(headerTitle: "필수 금융 앱", apps: appList)

                    
                    AppSectionBoxView(headerTitle: "유료 순위", apps: appList)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationTitle("금융")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

