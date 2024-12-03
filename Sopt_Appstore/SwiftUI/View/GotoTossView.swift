//
//  GotoTossView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 12/3/24.
//

import SwiftUI
import UIKit

struct TossViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> TossViewController {
        return TossViewController()
    }
    
    func updateUIViewController(_ uiViewController: TossViewController, context: Context) {
    }
}
