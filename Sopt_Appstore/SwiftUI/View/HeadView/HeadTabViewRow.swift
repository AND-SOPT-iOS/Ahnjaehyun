//
//  HeadHorizenScrollView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI

struct HeadTabViewRow: View {
    var title: String
    var subtitle: String
    var overlayTitle: String
    var overlaySubtitle: String
    var buttonText: String
    var purchaseText: String
    var backgroundImage: String
    var overlayIcon: String
    
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
                
                VStack(alignment: .leading, spacing: -35) {
                    HStack {
                        Image(overlayIcon)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(10)
                        
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


