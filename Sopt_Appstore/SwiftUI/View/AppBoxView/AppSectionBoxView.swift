//
//  AppSectionBoxView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct AppSectionBoxView: View {
    
    @ObservedObject var viewModel: NavigationViewModel
    
    let headerTitle: String
    let headerDescript: String
    
    let apps: [SwiftUIApp]
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 1)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack{
                
                Text(headerTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                NavigationLink(destination: AppChartView(viewModel:viewModel)) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                
            }
            
            Text(headerDescript)
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.leading)
            
            TabView {
                ForEach(paginate(apps: apps, itemsPerPage: 3), id: \.self) { pageApps in
                    LazyVGrid(columns: columns, spacing: 6) {
                        ForEach(pageApps) { app in
                            HomeAppRow(app: app)
                               
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
    
    private func paginate(apps: [SwiftUIApp], itemsPerPage: Int) -> [[SwiftUIApp]] {
        stride(from: 0, to: apps.count, by: itemsPerPage).map {
            Array(apps[$0..<min($0 + itemsPerPage, apps.count)])
        }
    }
}
