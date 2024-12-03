//
//  Applist.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/27/24.
//

import SwiftUI

struct AppChartView: View {
    
    let appList = App.mockData
    @State private var selectedApp: App?
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                ForEach(appList, id: \.ranking) { app in
                    AppRow(app: app)
                }
                .padding(.horizontal, 13)
                
            }
            .background(Color.black.ignoresSafeArea())
            
        }
        .navigationTitle("Chart")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color(red: 22/255, green: 22/255, blue: 24/255).opacity(0.95), for: .navigationBar)
    }
}



#Preview{
    AppChartView()
}
