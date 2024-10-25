//
//  InfoViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//
import UIKit
import SnapKit

class InfoViewController: UIViewController {
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let bulletLabel: UILabel = {
        let label = UILabel()
        label.text = "● 내 금융 현황을 한눈에, 홈·소비"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private let accountInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "· 모든 계좌의 모든 정보를 한 곳에서, 따로 보였던 예적금, 청약"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private let moreInfoButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedString = NSMutableAttributedString(string: " 더 보기")
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: NSRange(location: 0, length: attributedString.length))
        button.setAttributedTitle(attributedString, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.contentHorizontalAlignment = .left
        return button
    }()

    private let developerLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Viva Republica")
        attributedString.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let developerInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let chevronButton: UIButton = {
        let button = UIButton(type: .system)
        let chevronImage = UIImage(systemName: "chevron.right")
        button.setImage(chevronImage, for: .normal)
        button.tintColor = .gray
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupUI()
        
        //accountInfoLabel 에 그라데이션을 넣었습니더.
        applyGradientMaskToLabel(accountInfoLabel)

    }
    
    private func setupUI() {
        view.addSubview(infoLabel)
        view.addSubview(bulletLabel)
        view.addSubview(accountInfoLabel)
        view.addSubview(moreInfoButton)
        view.addSubview(developerLabel)
        view.addSubview(developerInfoLabel)
        view.addSubview(chevronButton)

        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        bulletLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(10)
            make.leading.equalTo(infoLabel)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        accountInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(bulletLabel.snp.bottom).offset(10)
            make.leading.equalTo(bulletLabel)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        moreInfoButton.snp.makeConstraints { make in
            make.centerY.equalTo(accountInfoLabel)

            make.trailing.equalToSuperview().offset(-20)
        }
        
        developerLabel.snp.makeConstraints { make in
            make.top.equalTo(moreInfoButton.snp.bottom).offset(15)
            make.leading.equalTo(infoLabel)
        }

        developerInfoLabel.snp.makeConstraints { make in
            make.leading.equalTo(developerLabel.snp.trailing).offset(10)
            make.bottom.equalTo(developerLabel.snp.bottom)
        }
        
        chevronButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(developerLabel)
            make.width.height.equalTo(20)
        }
    }
    private func applyGradientMaskToLabel(_ label: UILabel) {
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.clear.cgColor]
           gradientLayer.locations = [0.7, 1.0]
           gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
           gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
           gradientLayer.frame = label.bounds
           
           label.layer.mask = gradientLayer
       }
       
    
    //원래 컴포넌트가 로딩이되고 그다음 그라데이션을 넣어야 잘 보임
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           // 레이아웃이 완료된 후 그라데이션 다시 적용
           applyGradientMaskToLabel(accountInfoLabel)
           
       }
    
}

#Preview {
    InfoViewController()
}
