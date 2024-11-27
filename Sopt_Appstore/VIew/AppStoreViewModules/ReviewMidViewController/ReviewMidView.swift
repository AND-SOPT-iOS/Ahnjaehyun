//
//  FooterViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//
import UIKit
import SnapKit

protocol ReviewContentConfigurable {
    func configure(with reviewTitle: String, reviewDate: String, reviewContent: String, developerResponseTitle: String, responseDate: String, developerResponseContent: String)
}

class ReviewMidView: UIView, ReviewContentConfigurable {
    
    private let reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center
        stackView.layer.cornerRadius = 20
        for _ in 1...5 {
            let starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
            starImageView.tintColor = .white
            starImageView.snp.makeConstraints { make in
                make.width.height.equalTo(13)
            }
            stackView.addArrangedSubview(starImageView)
        }
        return stackView
    }()
    
    private let reviewDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let reviewContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let developerResponseTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private let responseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let developerResponseContentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func configure(with reviewTitle: String, reviewDate: String, reviewContent: String, developerResponseTitle: String, responseDate: String, developerResponseContent: String) {
        reviewTitleLabel.text = reviewTitle
        reviewDateLabel.text = reviewDate
        reviewContentLabel.text = reviewContent
        developerResponseTitleLabel.text = developerResponseTitle
        responseDateLabel.text = responseDate
        developerResponseContentLabel.text = developerResponseContent
    }
    
    private func setupUI() {
        backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        
        addSubview(reviewTitleLabel)
        addSubview(starStackView)
        addSubview(reviewDateLabel)
        addSubview(reviewContentLabel)
        addSubview(developerResponseTitleLabel)
        addSubview(responseDateLabel)
        addSubview(developerResponseContentLabel)
        
        reviewTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        starStackView.snp.makeConstraints { make in
            make.top.equalTo(reviewTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(reviewTitleLabel)
        }
        
        reviewDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(starStackView.snp.trailing).offset(10)
            make.centerY.equalTo(starStackView)
        }
        
        reviewContentLabel.snp.makeConstraints { make in
            make.top.equalTo(starStackView.snp.bottom).offset(10)
            make.leading.equalTo(reviewTitleLabel)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        developerResponseTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(reviewContentLabel.snp.bottom).offset(20)
            make.leading.equalTo(reviewTitleLabel)
        }
        
        responseDateLabel.snp.makeConstraints { make in
            make.leading.equalTo(developerResponseTitleLabel.snp.trailing).offset(10)
            make.centerY.equalTo(developerResponseTitleLabel)
        }
        
        developerResponseContentLabel.snp.makeConstraints { make in
            make.top.equalTo(developerResponseTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(reviewTitleLabel)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
    #Preview {
        let reviewView = ReviewMidView()
        reviewView.configure(
            with: "리뷰 제목 예시",
            reviewDate: "10월 31일",
            reviewContent: "토스 앱 업데이트 이후 UI가 예전만큼 직관적이지 않다고 느낍니다. 예전의 색깔이 사라진 것 같아 아쉽네요.",
            developerResponseTitle: "개발자 답변",
            responseDate: "11월 1일",
            developerResponseContent: "안녕하세요, 토스 팀입니다. 소중한 피드백에 감사드립니다. 사용자 경험을 개선하기 위해 꾸준히 노력하겠습니다."
        )
        return reviewView
    }
