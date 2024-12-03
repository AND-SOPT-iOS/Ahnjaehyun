//
//  AppSectionBoxView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct AppSectionBoxView: View {
    let headerTitle: String
    let headerDescript: String
    
    let apps: [App]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 1)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack{
                
                Text(headerTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                NavigationLink(destination: DefaultView()) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                
            }
            
            Text(headerDescript)
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.leading)
            
            TabView {
                ForEach(paginate(apps: apps, itemsPerPage: 3), id: \.self) { pageApps in
                    LazyVGrid(columns: columns, spacing: 6) {
                        ForEach(pageApps) { app in
                            AppRow(app: app)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
    
    private func paginate(apps: [App], itemsPerPage: Int) -> [[App]] {
        stride(from: 0, to: apps.count, by: itemsPerPage).map {
            Array(apps[$0..<min($0 + itemsPerPage, apps.count)])
        }
    }
}

#Preview {
    AppSectionBoxView(
        headerTitle: "필수 금융 앱",
        headerDescript: "App Store 에디터가 직접 골랐습니다",
        apps: App.mockData
    )
}
