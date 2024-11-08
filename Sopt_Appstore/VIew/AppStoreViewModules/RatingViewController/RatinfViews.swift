//
//  RatinfViews.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/31/24.
//

import UIKit
import SnapKit

class RatingViews: UIView {
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let ratingMid: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGray
        return label
    }()
    
    private let ratingBottom: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private let verticalSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let ratingStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    private let mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        ratingStack.addArrangedSubview(ratingLabel)
        ratingStack.addArrangedSubview(ratingMid)
        ratingStack.addArrangedSubview(ratingBottom)
        
        mainStack.addArrangedSubview(verticalSeparator)
        mainStack.addArrangedSubview(ratingStack)
        mainStack.addArrangedSubview(verticalSeparator)
        
        addSubview(mainStack)
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        verticalSeparator.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(30)
        }
    }
    
    func configure(ratingText: String, ratingValue: String, starText: String) {
        ratingLabel.text = ratingText
        ratingMid.text = ratingValue
        ratingBottom.text = starText
    }
}

#Preview {
    let ratingView = RatingViews()
    ratingView.configure(ratingText: "8.4만개의 평가", ratingValue: "4.4", starText: "★★★★★")
    return ratingView
}
