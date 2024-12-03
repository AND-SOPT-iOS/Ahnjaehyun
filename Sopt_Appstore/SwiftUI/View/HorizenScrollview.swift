//
//  HorizenScrollview.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct HorizenScrollview: View {
    
    let appList = App.mockData

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    Section(header: Text("새로운 앱")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(appList) { app in
                                    VStack {
                                        Image(uiImage: app.iconImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150, height: 150)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        Text(app.title)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .lineLimit(1)
                                    }
                                    .frame(width: 150)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    
                    BoxView(headerTitle: "필수 금융 앱", apps: appList)

                    
                    BoxView(headerTitle: "유료 순위", apps: appList)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationTitle("금융")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview{
    HorizenScrollview()
}
