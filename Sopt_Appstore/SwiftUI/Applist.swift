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
                
                VStack() {
                    
                    ForEach(appList, id: \.ranking) { app in
                        AppRow(app: app)
                        
                    }
                    .padding(.horizontal, 13)
                    
                }
            }
            .background(Color.black.ignoresSafeArea())
         
                   }
        .navigationTitle("Chart")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color(red: 22/255, green: 22/255, blue: 24/255).opacity(0.95), for: .navigationBar)
          
        }
    
}


struct AppRow: View {
    let app: App
    @State private var showDetailView : Bool = false

    var body: some View {
        HStack(spacing: 12) {
            Image(uiImage: app.iconImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height: 65)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(app.ranking). \(app.title)")
                    .font(.headline)
                    .foregroundColor(.white)
                Text(app.category)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Button(action: {
                showDetailView.toggle()
            }) {
                Text(app.downloadState.rawValue)
                    .font(.body)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .foregroundColor(.blue)
                    .background(Color.white.cornerRadius(10))
            }
        }
        .onTapGesture {
            showDetailView.toggle()
        }
        .padding(10)
        .background(Color.black)
        .cornerRadius(10)
        .navigationDestination(isPresented: $showDetailView) {
            if app.ranking==7 {
                EntertainmentView(app: app)
            } else {
                DefaultView()
            }
            
            
        }
    }
}


#Preview{
    AppChartView()
}
