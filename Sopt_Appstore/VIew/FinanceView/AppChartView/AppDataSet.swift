//
//  AppDataSet.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/31/24.
//


import UIKit


struct App {
    let iconImage: UIImage
    let title: String
    let downloadState: DawnloadState
    let subTitle: String
    let category: String
    let ranking: Int
}

extension App {
    static let mockData: [App] = [
        App(iconImage: UIImage(named: "Toss_App_Icon")!, title: "토스", downloadState: .installed, subTitle: "앱내 구입", category: "browsing", ranking: 1),
        App(iconImage: UIImage(named: "2")!, title: "Books", downloadState: .dawnload, subTitle: "앱내 구입", category: "education", ranking: 2),
        App(iconImage: UIImage(named: "3")!, title: "Clock", downloadState: .installed, subTitle: "앱내 구입", category: "utilities", ranking: 3),
        App(iconImage: UIImage(named: "4")!, title: "App Store", downloadState: .dawnload, subTitle: "앱내 구입", category: "shopping", ranking: 4),
        App(iconImage: UIImage(named: "5")!, title: "iTunes", downloadState: .installed, subTitle: "앱내 구입", category: "music", ranking: 5),
        App(iconImage: UIImage(named: "6")!, title: "Contacts", downloadState: .dawnload, subTitle: "앱내 구입", category: "utilities", ranking: 6),
        App(iconImage: UIImage(named: "7")!, title: "Podcasts", downloadState: .dawnload, subTitle: "앱내 구입", category: "entertainment", ranking: 7),
        App(iconImage: UIImage(named: "8")!, title: "Calculator", downloadState: .dawnload, subTitle: "앱내 구입", category: "utilities", ranking: 8),
        App(iconImage: UIImage(named: "9")!, title: "Camera", downloadState: .installed, subTitle: "앱내 구입", category: "photo & video", ranking: 9),
        App(iconImage: UIImage(named: "10")!, title: "Compass", downloadState: .installed, subTitle: "앱내 구입", category: "utilities", ranking: 10),
        App(iconImage: UIImage(named: "11")!, title: "Mail", downloadState: .installed, subTitle: "앱내 구입", category: "productivity", ranking: 11),
        App(iconImage: UIImage(named: "12")!, title: "Voice Memos", downloadState: .installed, subTitle: "앱내 구입", category: "utilities", ranking: 12),
        App(iconImage: UIImage(named: "13")!, title: "Apple TV", downloadState: .installed, subTitle: "앱내 구입", category: "entertainment", ranking: 13),
        App(iconImage: UIImage(named: "14")!, title: "Settings", downloadState: .installed, subTitle: "앱내 구입", category: "utilities", ranking: 14),
        App(iconImage: UIImage(named: "15")!, title: "Tips", downloadState: .dawnload, subTitle: "앱내 구입", category: "education", ranking: 15),
        App(iconImage: UIImage(named: "16")!, title: "News", downloadState: .dawnload, subTitle: "앱내 구입", category: "news", ranking: 16),
        App(iconImage: UIImage(named: "17")!, title: "Phone", downloadState: .dawnload, subTitle: "앱내 구입", category: "communication", ranking: 17),
        App(iconImage: UIImage(named: "18")!, title: "Safari", downloadState: .dawnload, subTitle: "앱내 구입", category: "browsing", ranking: 18),
        App(iconImage: UIImage(named: "tictokIcon")!, title: "抖音", downloadState: .dawnload, subTitle: "入手", category: "browsing", ranking: 19),
        App(iconImage: UIImage(named: "1")!, title: "Home", downloadState: .dawnload, subTitle: "다운", category: "utilities", ranking: 20),

    ]
}


enum DawnloadState: String{
    
    case installed = "설치"
    case dawnload = "구매"
    case redawnload = "재구매"
    case update = "업데이트"
    
}

