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
        App(iconImage: UIImage(named: "Toss_App_Icon")!, title: "Apple Map", downloadState: .dawnload, subTitle: "다운", category: "navigation", ranking: 1),
        App(iconImage: UIImage(named: "Toss_App_Icon")!, title: "Apple Music", downloadState: .dawnload, subTitle: "다운", category: "music", ranking: 2),
        App(iconImage: UIImage(named: "Toss_App_Icon")!, title: "Apple TV", downloadState: .dawnload, subTitle: "다운", category: "entertainment", ranking: 3)
            ]
}

enum DawnloadState: String{
    
    case installed = "설치"
    case dawnload = "구매"
    case redawnload = "재구매"
    case update = "업데이트"
    
}

