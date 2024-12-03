//
//  AppRow.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

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
            } else if app.ranking==1 {
                TossViewRepresentable()
            } else {
                DefaultView()
            }
            
            
        }
    }
}


struct HomeAppRow: View {
    let app: SwiftUIApp
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
        
    }
}

