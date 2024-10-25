//
//  FooterViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//

import Foundation
import UIKit
import SnapKit
import Foundation
import UIKit
import SnapKit

class ReviewMidViewController: UIViewController {

    
    private let reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "토스 UX 전버전으로 해주세요"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()

    
    private let starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center

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
        label.text = "9월 27일 · 흑 운영자님 ㅠㅠ"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()

    
    private let reviewContentLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 업데이트가 토스 만의 UX 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이제는..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    
    private let developerResponseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자 답변"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    
    private let responseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "9월 29일"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    
    private let developerResponseContentLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요. 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 요구를 반영해 조금 더 개선해 나가겠습니다."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1.0)
        setupUI()
    }

    private func setupUI() {
        view.addSubview(reviewTitleLabel)
        view.addSubview(starStackView)
        view.addSubview(reviewDateLabel)
        view.addSubview(reviewContentLabel)
        view.addSubview(developerResponseTitleLabel)
        view.addSubview(responseDateLabel)
        view.addSubview(developerResponseContentLabel)

        reviewTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
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
    ReviewMidViewController()
}
