//
//  MainView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/27/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var selected: Tab = .left
    @State private var isNavigating = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                Group {
                    if selected == .left {
                        FinanceView(isNavigating: $isNavigating)
                            .toolbar(.hidden, for: .tabBar)
                    } else if selected == .center {
                        AppChartView()
                            .toolbar(.hidden, for: .tabBar)
                    } else if selected == .right {
                        DefaultView2()
                            .toolbar(.hidden, for: .tabBar)
                    }
                }
            }
            
            VStack {
                Spacer()
                if !isNavigating {
                    tabBar
                }
            }
        }
        
    }
    
    
    var tabBar: some View {
        HStack {
            Spacer()
            Button {
                selected = .left
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "house.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    if selected == .left {
                        Text("투데이")
                            .font(.system(size: 11))
                    }
                }
            }
            .foregroundStyle(selected == .left ? Color.accentColor : Color.gray)
            Spacer()
            Button {
                selected = .center
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "app.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    if selected == .center {
                        Text("앱")
                            .font(.system(size: 11))
                    }
                }
            }
            .foregroundStyle(selected == .center ? Color.accentColor : Color.gray)
            Spacer()
            Button {
                selected = .right
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "cube.box.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                    if selected == .right {
                        Text("아케이드")
                            .font(.system(size: 11))
                    }
                }
            }
            .foregroundStyle(selected == .right ? Color.accentColor : Color.gray)
            Spacer()
        }
        .padding()
        .frame(height: 72)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(red: 22/255, green: 22/255, blue: 24/255).opacity(0.95))
                .shadow(color: .white.opacity(0.15), radius: 8, y: 2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    MainView()
}
