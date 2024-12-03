//
//  SwiftUIAppViewModel.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

class SwiftUIAppViewModel: ObservableObject {
    @Published private(set) var apps: [SwiftUIApp] = []
    
    init() {
        fetchApps()
    }
    
    private func fetchApps() {
        apps = App.mockData.map {
            SwiftUIApp(
                iconImage: $0.iconImage,
                title: $0.title,
                downloadState: $0.downloadState,
                subTitle: $0.subTitle,
                category: $0.category,
                ranking: $0.ranking
            )
        }
    }
    
    func filterApps(by category: String) -> [SwiftUIApp] {
        apps.filter { $0.category == category }
    }
    
    func sortAppsByRanking() -> [SwiftUIApp] {
        apps.sorted { $0.ranking < $1.ranking }
    }
    
    func sortAppsByDownloadState() -> [SwiftUIApp] {
        apps.sorted { $0.downloadState.rawValue < $1.downloadState.rawValue }
    }
}
