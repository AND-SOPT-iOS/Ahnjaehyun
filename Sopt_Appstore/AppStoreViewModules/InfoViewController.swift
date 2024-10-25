//
//  InfoViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//

import Foundation
import UIKit
import SnapKit

class InfoViewController: UIViewController {

    // 제목 레이블 ("새로운 소식")
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()

    // 버전 정보 레이블 ("버전 5.185.0")
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "버전 5.185.0"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    
      // ">" 버튼
      private let arrowButton: UIButton = {
          let button = UIButton(type: .system)
          let arrowImage = UIImage(systemName: "chevron.right") // SF Symbol 사용
          button.setImage(arrowImage, for: .normal)
          button.tintColor = .gray
          return button
      }()
      

    // 업데이트 설명 레이블
    private let updateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0 // 여러 줄로 표시 가능하도록 설정
        return label
    }()

    // "6일 전" 레이블
    private let timeAgoLabel: UILabel = {
        let label = UILabel()
        label.text = "6일 전"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 배경색 설정
        view.backgroundColor = .black
        
        // UI 설정 함수 호출
        setupUI()
    }

    // UI 설정
    private func setupUI() {
        // 각 요소를 뷰에 추가
        view.addSubview(titleLabel)
        view.addSubview(versionLabel)
        view.addSubview(updateDescriptionLabel)
        view.addSubview(timeAgoLabel)
        view.addSubview(arrowButton)

        // 제목 레이블 제약 설정
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        arrowButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(2)
            make.leading.equalTo(titleLabel.snp.trailing).offset(2)
            make.width.height.equalTo(20) // 버튼 크기
           }

        // 버전 레이블 제약 설정
        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel)
        }

        // 업데이트 설명 레이블 제약 설정
        updateDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(versionLabel.snp.bottom).offset(10)
            make.leading.equalTo(titleLabel)
            make.trailing.equalToSuperview().offset(-20)
        }

        // "6일 전" 레이블 제약 설정
        timeAgoLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            
            make.trailing.equalToSuperview().offset(-20)
            
            
        }
        // ">" 버튼 액션 설정 (클릭 시 호출)
           arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
       

     
    }
// ">" 버튼 클릭 시 동작
@objc func arrowButtonTapped() {
    print("화살표 버튼 클릭됨")
    // 새로운 화면을 띄우거나, 특정 동작을 처리할 수 있음
}
}

#Preview {
    InfoViewController()
}
