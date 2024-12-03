//
//  ne.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/28/24.
//

import SwiftUI

struct EntertainmentView: View {
    let app: App
    
    var body: some View {
        HStack{
            Spacer()
            VStack {
                Image(uiImage: app.iconImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Text("앱 이름: \(app.title)")
                    .font(.title)
                    .padding()
                
                Text("카테고리: \(app.category)")
                    .font(.headline)
                
                Spacer()
            }
            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
        .foregroundColor(.white)
    }
}
