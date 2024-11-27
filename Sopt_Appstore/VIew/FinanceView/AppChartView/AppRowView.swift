//
//  AppRowView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/31/24.
//

import UIKit
import SnapKit
import SwiftUI
import Then

class AppRowView: UITableViewCell {
    
    var onActionButtonTapped: (() -> Void)?

    static let identifier: String = "AppRowView"
    
    private let titleLabel = UILabel()
    private let purchaseLabel = UILabel.makePurchaseLabel(with: "구입")
    private let iconImageView = UIImageView()
    private let actionButton = UIButton.makeActionButton(with: "받기")
    private let categoryLabel = UILabel()
    private let rankingLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUI()
        setStyle()
        setLayout()
        setupActions() 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        backgroundColor = .black
        titleLabel.do {
            $0.numberOfLines = 2
            $0.textColor = .white
        }
        
        iconImageView.do {
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        categoryLabel.do {
            $0.textColor = .systemGray
        }
        rankingLabel.do {
            $0.textColor = .white
        }
        purchaseLabel.do {
            $0.textColor = .lightGray
        }
    }
    
    private func setUI() {
        [
            iconImageView,
            rankingLabel,
            actionButton,
            categoryLabel,
            titleLabel,
            purchaseLabel
        ].forEach { contentView.addSubview($0) }
    }
    
    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(65)
            $0.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.top.equalTo(iconImageView.snp.top).offset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(8)
            $0.top.equalTo(rankingLabel.snp.top)
            $0.trailing.equalTo(actionButton.snp.leading).offset(-8)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
        
        purchaseLabel.snp.makeConstraints {
            $0.centerX.equalTo(actionButton)
            $0.top.equalTo(actionButton.snp.bottom).offset(3)
            $0.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
        
        actionButton.snp.makeConstraints {
            $0.top.equalTo(rankingLabel)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.lessThanOrEqualToSuperview().offset(-10)
        }
    }
    
    func configure(app: App) {
        iconImageView.image = app.iconImage
        rankingLabel.text = app.ranking.description
        titleLabel.text = app.title
        categoryLabel.text = app.category
        purchaseLabel.text = app.subTitle
        actionButton.setTitle(app.downloadState.rawValue, for: .normal)
    }
    
    private func setupActions() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc private func actionButtonTapped() {
        onActionButtonTapped?()
    }
}
