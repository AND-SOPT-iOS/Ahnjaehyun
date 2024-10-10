//
//  DetailViewControll.swift
//  SoptFirstWeek
//
//  Created by Jaehyun Ahn on 10/10/24.
//


import Foundation
import UIKit


// DetailViewController 정의
class DetailViewController: UIViewController {
    
    // 제목 레이블
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    // 이름 레이블
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // 메시지 레이블
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // 돌아가기 버튼
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("돌아가기", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 받은 데이터
    private var receivedTitle: String?
    private var receivedName: String?
    private var receivedMessage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setUI()
        setLayout()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateUI()
    }

    
    // UI 설정
    private func setUI() {
        [titleLabel, nameLabel, messageLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    // Layout 설정
    private func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 40),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            backButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    // UI 업데이트 함수
    func updateUI() {
        titleLabel.text = receivedTitle
        nameLabel.text = receivedName
        messageLabel.text = receivedMessage
    }

    // 데이터 바인딩 함수
    func setupData(title: String, name: String, message: String) {
        self.receivedTitle = title
        self.receivedName = name
        self.receivedMessage = message
    }

    // 뒤로가기 버튼 눌렀을 때 동작
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
