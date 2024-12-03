//
//  ㄴㄴㄴ.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct SwiftUIApp: Identifiable, Hashable {
    let id = UUID()
    let iconImage: UIImage
    let title: String
    let downloadState: DownloadState
    let subTitle: String
    let category: String
    var ranking: Int
}

