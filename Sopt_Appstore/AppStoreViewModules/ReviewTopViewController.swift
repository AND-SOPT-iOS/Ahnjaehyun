//
//  FeatureViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//
import Foundation
import UIKit
import SnapKit

class ReviewTopViewController: UIViewController {

    // "평가 및 리뷰" 레이블
    private let reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "평가 및 리뷰"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()

    // 별점 레이팅
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textColor = .white
        return label
    }()

    // 가장 도움이 되는 리뷰 텍스트
    private let helpfulReviewLabel: UILabel = {
        let label = UILabel()
        label.text = "가장 도움이 되는 리뷰"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()

    // 별점 이미지 배열 (4.5개의 별)
    private let starStackView: UIStackView = {
        let starFilled = UIImage(systemName: "star.fill")
        let starHalf = UIImage(systemName: "star.leadinghalf.filled")
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        
        for _ in 1...4 {
            let starImageView = UIImageView(image: starFilled)
            starImageView.tintColor = .white
            starImageView.snp.makeConstraints { make in
                make.width.height.equalTo(20)
            }
            stackView.addArrangedSubview(starImageView)
        }
        
        let halfStarImageView = UIImageView(image: starHalf)
        halfStarImageView.tintColor = .white
        halfStarImageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        stackView.addArrangedSubview(halfStarImageView)
        
       
        
        return stackView
    }()

    private let reviewCountLabel: UILabel = {
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()

    // 오른쪽 화살표 버튼
    private let arrowButton: UIButton = {
        let button = UIButton(type: .system)
        let arrowImage = UIImage(systemName: "chevron.right")
        button.setImage(arrowImage, for: .normal)
        button.tintColor = .gray
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }

    private func setupUI() {
        view.addSubview(reviewTitleLabel)
        view.addSubview(ratingLabel)
        view.addSubview(helpfulReviewLabel)
        view.addSubview(starStackView)
        view.addSubview(reviewCountLabel)
        view.addSubview(arrowButton)

        reviewTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        arrowButton.snp.makeConstraints { make in
            make.centerY.equalTo(reviewTitleLabel)
            make.leading.equalTo(reviewTitleLabel.snp.trailing).offset(8)
            make.width.height.equalTo(20)
        }

        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(reviewTitleLabel.snp.bottom).offset(15)
            make.leading.equalTo(reviewTitleLabel)
        }

        helpfulReviewLabel.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).offset(15)
            make.leading.equalTo(ratingLabel)
        }

        starStackView.snp.makeConstraints { make in
            make.bottom.equalTo(reviewCountLabel.snp.top).offset(-10)
            make.trailing.equalToSuperview().offset(-20)
        }

        reviewCountLabel.snp.makeConstraints { make in
            make.bottom.equalTo(ratingLabel)
            make.trailing.equalToSuperview().offset(-20)

        }
    }
}

#Preview {
    ReviewTopViewController()
}
