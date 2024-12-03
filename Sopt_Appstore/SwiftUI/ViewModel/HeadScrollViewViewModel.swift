//
//  ViewModel.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

class HeadScrollViewViewModel: ObservableObject {
 
    @Published var rows: [HeadScrollViewRowData] = []
    
    init() {
        fetchRows()
    }
    
    func fetchRows() {
        rows = [
            HeadScrollViewRowData(
                title: "Fortune City - A Finance App",
                subtitle: "게임을 하듯 관리하는 가계부",
                overlayTitle: "抖音",
                overlaySubtitle: "抖音是一款流行的短视频应用程序",
                buttonText: "받기",
                purchaseText: "앱 내 구입",
                backgroundImage: "background",
                overlayIcon: "tictokIcon"
            ),
            HeadScrollViewRowData(
                title: "Fortune City - A Finance App",
                subtitle: "게임을 하듯 관리하는 가계부",
                overlayTitle: "抖音",
                overlaySubtitle: "抖音是一款流行的短视频应用程序",
                buttonText: "받기",
                purchaseText: "앱 내 구입",
                backgroundImage: "background",
                overlayIcon: "tictokIcon"
            ),
            HeadScrollViewRowData(
                title: "Fortune City - A Finance App",
                subtitle: "게임을 하듯 관리하는 가계부",
                overlayTitle: "抖音",
                overlaySubtitle: "抖音是一款流行的短视频应用程序",
                buttonText: "받기",
                purchaseText: "앱 내 구입",
                backgroundImage: "background",
                overlayIcon: "tictokIcon"
            )
        ]
    }
}
