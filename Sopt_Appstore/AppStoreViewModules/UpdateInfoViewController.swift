//
//  UpdateInfoViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//


import UIKit
import SnapKit

class UpdateInfoViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()

    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "버전 5.185.0"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let arrowButton: UIButton = {
        let button = UIButton(type: .system)
        let arrowImage = UIImage(systemName: "chevron.right")
        button.setImage(arrowImage, for: .normal)
        button.tintColor = .gray
        return button
    }()
      
    private let updateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private let timeAgoLabel: UILabel = {
        let label = UILabel()
        label.text = "6일 전"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(versionLabel)
        view.addSubview(updateDescriptionLabel)
        view.addSubview(timeAgoLabel)
        view.addSubview(arrowButton)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        arrowButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(2)
            make.leading.equalTo(titleLabel.snp.trailing).offset(2)
            make.width.height.equalTo(20)
        }

        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel)
        }

        updateDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(versionLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().offset(-20)
        }

        timeAgoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
    }

    @objc func arrowButtonTapped() {
        print("화살표 버튼 클릭됨")
    }
}

#Preview {
    UpdateInfoViewController()
}
