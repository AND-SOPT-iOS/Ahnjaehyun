//
//  Model.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import Foundation

struct HeadScrollViewRowData: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let overlayTitle: String
    let overlaySubtitle: String
    let buttonText: String
    let purchaseText: String
    let backgroundImage: String
    let overlayIcon: String
}
