//
//  ComponentExtension.swift
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
        config.attributedTitle = AttributedString("  받기  ", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 10, weight: .bold)
        ]))
        let button = UIButton(configuration: config, primaryAction: nil)

        return button
    }
}


extension UILabel {
    static func makePurchaseLabel() -> UILabel {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = UIFont.systemFont(ofSize: 6)
        label.textColor = UIColor(white: 1.0, alpha: 0.7)
        label.textAlignment = .center
        return label
    }
}
