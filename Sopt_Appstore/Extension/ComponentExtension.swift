//
//  ComponentExtension.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//


import UIKit


extension UIButton {
    static func makeActionButton(with title: String) -> UIButton {
        var config = UIButton.Configuration.filled()
        
        config.baseBackgroundColor = .systemGray6
        config.cornerStyle = .capsule
        config.attributedTitle = AttributedString("\(title)", attributes: AttributeContainer([
            .font: UIFont.systemFont(ofSize: 10, weight: .bold)
        ]))
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20)
        config.baseForegroundColor = .systemBlue

        let button = UIButton(configuration: config, primaryAction: nil)
        return button
    }
}

extension UILabel {
    static func makePurchaseLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(white: 1.0, alpha: 0.7)
        label.textAlignment = .center
        return label
    }
}
