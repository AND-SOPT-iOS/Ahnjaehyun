//
//  ReviewViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//
import Foundation
import UIKit
import SnapKit

class ReviewBottomViewController: UIViewController {

    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.text = "탭하여 평가하기"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()

    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center

        for _ in 1...5 {
            let starImageView = UIImageView(image: UIImage(systemName: "star"))
            starImageView.tintColor = .systemBlue
            starImageView.snp.makeConstraints { make in
                make.width.height.equalTo(30)
            }
            stackView.addArrangedSubview(starImageView)
        }

        return stackView
    }()

    
    private let writeReviewButton: UIButton = {
        let button = UIButton(type: .system)
        
        var config = UIButton.Configuration.plain()
        config.title = "리뷰 작성"
        config.image = UIImage(systemName: "square.and.pencil")
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 10)
        config.preferredSymbolConfigurationForImage = largeConfig
           
        config.baseForegroundColor = .systemBlue
        config.imagePadding = 8 
        config.background.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        config.background.cornerRadius = 15
        
        button.configuration = config
        
        return button
    }()
    
    
    private let supportButton: UIButton = {
        let button = UIButton(type: .system)
        
        var config = UIButton.Configuration.plain()
        config.title = "앱 지원"
        config.image = UIImage(systemName: "questionmark.circle")
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 10)
        config.preferredSymbolConfigurationForImage = largeConfig
           
        config.baseForegroundColor = .systemBlue
        config.imagePadding = 8
        config.background.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        config.background.cornerRadius = 15
        
        button.configuration = config
        
        return button
    }()

    // 버튼 스택뷰
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }

    private func setupUI() {
        view.addSubview(rateLabel)
        view.addSubview(starStackView)
        view.addSubview(buttonStackView)

        buttonStackView.addArrangedSubview(writeReviewButton)
        buttonStackView.addArrangedSubview(supportButton)

        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }

        starStackView.snp.makeConstraints { make in
            make.top.equalTo(rateLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }

        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(starStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
    }
}

#Preview {
    ReviewBottomViewController()
}
