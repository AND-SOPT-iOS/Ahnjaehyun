//
//  Applist.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/27/24.
//

import SwiftUI

struct AppChartView: View {
    let appList = AppData.mockData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(appList) { app in
                    AppRow(app: app)
                        .onTapGesture {
                            if app.title == "토스" {
                                navigateToTossView()
                            }
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .background(Color.black)
    }
    
    private func navigateToTossView() {
        print("네비")
    }
}


struct AppRow: View {
    let app: AppData
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


struct AppData: Identifiable {
    let id = UUID()
    let iconImage: UIImage
    let title: String
    let downloadState: DownloadState
    let subTitle: String
    let category: String
    let ranking: Int
}

extension AppData {
    static let mockData: [AppData] = [
        AppData(iconImage: UIImage(named: "Toss_App_Icon") ?? UIImage(), title: "토스", downloadState: .installed, subTitle: "앱내 구입", category: "금융", ranking: 1),
        AppData(iconImage: UIImage(named: "2") ?? UIImage(), title: "Books", downloadState: .download, subTitle: "앱내 구입", category: "교육", ranking: 2),
        AppData(iconImage: UIImage(named: "3") ?? UIImage(), title: "Clock", downloadState: .installed, subTitle: "앱내 구입", category: "유틸리티", ranking: 3),
        // More mock data here...
    ]
}

enum DownloadState: String {
    case installed = "설치"
    case download = "받기"
    case update = "업데이트"
}
