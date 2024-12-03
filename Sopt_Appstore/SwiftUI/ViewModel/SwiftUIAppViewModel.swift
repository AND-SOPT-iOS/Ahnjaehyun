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
        apps =   [
        SwiftUIApp(iconImage: UIImage(named: "Toss_App_Icon")!, title: "토스", downloadState: .installed, subTitle: "앱내 구입", category: "browsing", ranking: 1),
        SwiftUIApp(iconImage: UIImage(named: "2")!, title: "Books", downloadState: .dawnload, subTitle: "앱내 구입", category: "education", ranking: 2),
        SwiftUIApp(iconImage: UIImage(named: "3")!, title: "Clock", downloadState: .installed, subTitle: "앱내 구입", category: "utilities", ranking: 3),
        SwiftUIApp(iconImage: UIImage(named: "4")!, title: "App Store", downloadState: .dawnload, subTitle: "앱내 구입", category: "shopping", ranking: 4),
        SwiftUIApp(iconImage: UIImage(named: "5")!, title: "iTunes", downloadState: .installed, subTitle: "앱내 구입", category: "music", ranking: 5),
        SwiftUIApp(iconImage: UIImage(named: "6")!, title: "Contacts", downloadState: .dawnload, subTitle: "앱내 구입", category: "utilities", ranking: 6),
        SwiftUIApp(iconImage: UIImage(named: "7")!, title: "Podcasts", downloadState: .dawnload, subTitle: "앱내 구입", category: "entertainment", ranking: 7),
        SwiftUIApp(iconImage: UIImage(named: "8")!, title: "Calculator", downloadState: .dawnload, subTitle: "앱내 구입", category: "utilities", ranking: 8),
        SwiftUIApp(iconImage: UIImage(named: "9")!, title: "Camera", downloadState: .installed, subTitle: "앱내 구입", category: "photo & video", ranking: 9),
        SwiftUIApp(iconImage: UIImage(named: "10")!, title: "Compass", downloadState: .installed, subTitle: "앱내 구입", category: "utilities", ranking: 10),
        SwiftUIApp(iconImage: UIImage(named: "11")!, title: "Mail", downloadState: .installed, subTitle: "앱내 구입", category: "productivity", ranking: 11),
        SwiftUIApp(iconImage: UIImage(named: "12")!, title: "Voice Memos", downloadState: .installed, subTitle: "앱내 구입", category: "utilities", ranking: 12),
        SwiftUIApp(iconImage: UIImage(named: "13")!, title: "Apple TV", downloadState: .installed, subTitle: "앱내 구입", category: "entertainment", ranking: 13),
        SwiftUIApp(iconImage: UIImage(named: "14")!, title: "Settings", downloadState: .installed, subTitle: "앱내 구입", category: "utilities", ranking: 14),
        SwiftUIApp(iconImage: UIImage(named: "15")!, title: "Tips", downloadState: .dawnload, subTitle: "앱내 구입", category: "education", ranking: 15),
        SwiftUIApp(iconImage: UIImage(named: "16")!, title: "News", downloadState: .dawnload, subTitle: "앱내 구입", category: "news", ranking: 16),
        SwiftUIApp(iconImage: UIImage(named: "17")!, title: "Phone", downloadState: .dawnload, subTitle: "앱내 구입", category: "communication", ranking: 17),
        SwiftUIApp(iconImage: UIImage(named: "18")!, title: "Safari", downloadState: .dawnload, subTitle: "앱내 구입", category: "browsing", ranking: 18),
        SwiftUIApp(iconImage: UIImage(named: "tictokIcon")!, title: "抖音", downloadState: .dawnload, subTitle: "入手", category: "browsing", ranking: 19),
        SwiftUIApp(iconImage: UIImage(named: "1")!, title: "Home", downloadState: .dawnload, subTitle: "다운", category: "utilities", ranking: 20)
                    ]
    }
    
    func filterApps(by category: String) -> [SwiftUIApp] {
            apps
                .filter { $0.category == category }
                .enumerated()
                .map { index, app in
                    var updatedApp = app
                    updatedApp.ranking = index + 1
                    return updatedApp
                }
        }
    
    func sortAppsByRanking() -> [SwiftUIApp] {
        apps.sorted { $0.ranking < $1.ranking }
    }
    
    func sortAppsByDownloadState() -> [SwiftUIApp] {
        apps.sorted { $0.downloadState.rawValue < $1.downloadState.rawValue }
    }
}
