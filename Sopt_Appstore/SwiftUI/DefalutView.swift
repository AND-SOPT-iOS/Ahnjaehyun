//
//  DefalutView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/28/24.
//

import SwiftUI

struct DefaultView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("muyaho〜〜〜")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
    }
}

struct DefaultView2: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("muyaho〜〜〜")
                    .foregroundColor(.white)
                    .font(.title)
            }
        }
    }
}
