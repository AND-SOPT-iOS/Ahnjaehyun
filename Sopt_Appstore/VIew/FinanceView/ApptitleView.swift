//
//  ApptitleView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//


import UIKit
import SnapKit

class ApptitleView: UIView {

    var onArrowButtonTapped: (() -> Void)?

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private let arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
        setupActions()
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }

    private func setupViews() {
        backgroundColor = .black
        addSubview(titleLabel)
        addSubview(arrowButton)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        arrowButton.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(5)
            make.centerY.equalTo(titleLabel)
            make.width.height.equalTo(20)
        }
    }

    private func setupActions() {
        arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
    }
    
    @objc private func arrowButtonTapped() {
        onArrowButtonTapped?()
    }
}
