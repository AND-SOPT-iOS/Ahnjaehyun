//
//  Tabbar.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/27/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        HStack {
            Spacer()
            TabBarItem(icon: "house.fill", label: "투데이")
            Spacer()
            TabBarItem(icon: "gamecontroller.fill", label: "게임")
            Spacer()
            TabBarItem(icon: "app.fill", label: "앱")
            Spacer()
            TabBarItem(icon: "cube.box.fill", label: "아케이드")
            Spacer()
            TabBarItem(icon: "magnifyingglass", label: "검색")
            Spacer()
        }
        .frame(height: 50)
        .background(Color(red: 25 / 255, green: 25 / 255, blue: 25 / 255))
    }
}

struct TabBarItem: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(.white)
            Text(label)
                .foregroundColor(.white)
                .font(.caption2)
        }
    }
}
