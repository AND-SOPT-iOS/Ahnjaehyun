//
//  HeadHorizenScrollView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct HeadHorizenScrollViewRow: View {
    var title: String = "Fortune City - A Finance App"
    var subtitle: String = "게임을 하듯 관리하는 가계부"
    var overlayTitle: String = "抖音"
    var overlaySubtitle: String = "抖音是一款流行的短视频应用程序"
    var buttonText: String = "받기"
    var purchaseText: String = "앱 내 구입"
    var backgroundImage: String = "background"
    var overlayIcon: String = "tictokIcon"

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("新しい経験")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.blue)
            
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            Text(subtitle)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            ZStack(alignment: .bottomLeading) {
                Image(backgroundImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Image(overlayIcon)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(overlayTitle)
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            Text(overlaySubtitle)
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
                    
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                print("\(title) button tapped")
                            }) {
                                Text(buttonText)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.blue)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .background(Color.white)
                                    .cornerRadius(10)
                            }
                            Text(purchaseText)
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding()
            }
        }
        .padding(.horizontal)
        .background(Color.black)
    }
}


#Preview{HeadScrollViewRow()}
