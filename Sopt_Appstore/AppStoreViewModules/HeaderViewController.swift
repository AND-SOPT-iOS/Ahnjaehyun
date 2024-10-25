//
//  HeaderViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
import UIKit
import SnapKit

class HeaderViewController: UIViewController {
    
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Toss_App_Icon")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "토스"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private let appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "금융이 쉬워진다"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("업데이트", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        let shareImage = UIImage(systemName: "square.and.arrow.up")  // SF Symbol 사용
        button.setImage(shareImage, for: .normal)
        button.tintColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        
        view.backgroundColor = .black
        
        // 1. 앱 아이콘 설정
        view.addSubview(appIconImageView)
        appIconImageView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        

            make.width.height.equalTo(100)
            
        }
        
        // 2. 앱 이름 설정
        view.addSubview(appNameLabel)
        appNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(appIconImageView.snp.trailing).offset(20)
            make.top.equalTo(appIconImageView.snp.top)
        }
        
        // 3. 앱 설명 설정
        view.addSubview(appDescriptionLabel)
        appDescriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(appIconImageView.snp.trailing).offset(20)
            make.top.equalTo(appNameLabel.snp.bottom).offset(5)
        }
        
        // 4. 업데이트 버튼 설정
        view.addSubview(updateButton)
        updateButton.snp.makeConstraints { make in
            make.leading.equalTo(appIconImageView.snp.trailing).offset(20)
            make.bottom.equalTo(appIconImageView.snp.bottom)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        // 5. 공유 버튼 설정
        view.addSubview(shareButton)
        shareButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(appIconImageView.snp.bottom)
            make.width.height.equalTo(30)
        }
    }
}

#Preview {
    HeaderViewController()
}
