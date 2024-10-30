//
//  ApptitleView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//

import UIKit
import SnapKit

class ApptitleView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
     override init(frame: CGRect) {
         super.init(frame: frame)
         setupViews()
         setupConstraints()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         setupViews()
         setupConstraints()
     }
    
    func configure(title: String) {
        titleLabel.text = title
    }

    private func setupViews() {
        backgroundColor = .black
        addSubview(titleLabel)
        addSubview(arrowImageView)
    }
    
    
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(5)
            make.centerY.equalTo(titleLabel)
            make.width.height.equalTo(20)
        }
    }
}

#Preview{
    let appTitleView = ApptitleView()
    appTitleView.configure(title: "유료 순위")
    return appTitleView
}
