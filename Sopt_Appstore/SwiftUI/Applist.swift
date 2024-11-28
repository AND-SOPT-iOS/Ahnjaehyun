//
//  Applist.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/27/24.
//

import SwiftUI

struct AppChartView: View {
    let appList = App.mockData
    
    init() {
          customizeNavigationBar()
      }
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                VStack() {
                    ForEach(appList, id: \.ranking) { app in
                        AppRow(app: app)
                    }
                    .padding(.horizontal, 13)

                }

                
            }
            .background(Color.black.ignoresSafeArea())

        }
        .navigationTitle("Chart")
        .navigationBarTitleDisplayMode(.inline)
       

    }
    
    private func navigateToTossView() {
        print("네비")
    }
    
    private func customizeNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 불투명한 배경
        appearance.backgroundColor = UIColor.black.withAlphaComponent(0.7) // 배경 색상 설정
        
    
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}


struct AppRow: View {
    let app: App
    var onActionButtonTapped: (() -> Void)? = nil
    
    var body: some View {
        HStack(spacing: 12) {
            Image(uiImage: app.iconImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height: 65)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(app.ranking). \(app.title)")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(app.category)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {
                onActionButtonTapped?()
            }) {
                Text(app.downloadState.rawValue)
                    .font(.body)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .foregroundColor(.blue)
                    .background(Color.white.cornerRadius(10))
            }
        }
        .padding(10)
        .background(Color.black)
        .cornerRadius(10)
    }
}


#Preview{
    AppChartView()
}
