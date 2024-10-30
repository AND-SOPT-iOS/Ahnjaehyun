//
//  assetExtention.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//


import UIKit


extension UIButton {
    static func makeActionButton() -> UIButton {
        var config = UIButton.Configuration.filled()
        
        config.baseBackgroundColor = .systemGray6
        config.baseForegroundColor = .systemBlue
        config.cornerStyle = .capsule

        // 폰트 크기와 스타일을 적용하여 AttributedString 설정
        config.attributedTitle = AttributedString("  받기  ", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 10, weight: .bold)
        ]))

        // UIButton 생성 및 Configuration 설정 적용
        let button = UIButton(configuration: config, primaryAction: nil)

        return button
    }
}


extension UILabel {
    static func makePurchaseLabel() -> UILabel {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = UIFont.systemFont(ofSize: 6) // 폰트 크기 조정
        label.textColor = UIColor(white: 1.0, alpha: 0.7) // 조금 더 투명한 흰색
        label.textAlignment = .center // 가운데 정렬
        return label
    }
}
