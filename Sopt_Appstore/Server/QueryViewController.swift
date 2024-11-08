//
//  QueryViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/8/24.
//

import UIKit
import KeychainSwift
import SnapKit
import SwiftUI

class QueryViewController: UIViewController {

    private let userService = UserService()
    private let keychain = KeychainSwift()

    // UI Elements
    private let userIdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "유저 ID 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호 입력"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()

    private let hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "취미 입력"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let myHobbyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("내 취미 조회", for: .normal)
        return button
    }()

    private let myHobbyLabel: UILabel = {
        let label = UILabel()
        label.text = "내 취미 조회 결과"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()

    private let otherUserHobbyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("다른 유저 취미 조회", for: .normal)
        return button
    }()

    private let otherUserHobbyLabel: UILabel = {
        let label = UILabel()
        label.text = "다른 유저 취미 조회 결과"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()

    private let updateUserInfoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("유저 정보 변경", for: .normal)
        return button
    }()

    private let updateUserInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 정보 변경 결과"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Add button targets
        myHobbyButton.addTarget(self, action: #selector(handleMyHobbyQuery), for: .touchUpInside)
        otherUserHobbyButton.addTarget(self, action: #selector(handleOtherUserHobbyQuery), for: .touchUpInside)
        updateUserInfoButton.addTarget(self, action: #selector(handleUpdateUserInfo), for: .touchUpInside)
    }

    private func setupUI() {
        view.backgroundColor = .white

        // Add UI elements to view
        view.addSubview(userIdTextField)
        view.addSubview(passwordTextField)
        view.addSubview(hobbyTextField)
        view.addSubview(myHobbyButton)
        view.addSubview(myHobbyLabel)
        view.addSubview(otherUserHobbyButton)
        view.addSubview(otherUserHobbyLabel)
        view.addSubview(updateUserInfoButton)
        view.addSubview(updateUserInfoLabel)

        // Layout using Auto Layout
        userIdTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        hobbyTextField.translatesAutoresizingMaskIntoConstraints = false
        myHobbyButton.translatesAutoresizingMaskIntoConstraints = false
        myHobbyLabel.translatesAutoresizingMaskIntoConstraints = false
        otherUserHobbyButton.translatesAutoresizingMaskIntoConstraints = false
        otherUserHobbyLabel.translatesAutoresizingMaskIntoConstraints = false
        updateUserInfoButton.translatesAutoresizingMaskIntoConstraints = false
        updateUserInfoLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userIdTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userIdTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userIdTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            passwordTextField.topAnchor.constraint(equalTo: userIdTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            hobbyTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            hobbyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hobbyTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            updateUserInfoButton.topAnchor.constraint(equalTo: hobbyTextField.bottomAnchor, constant: 20),
            updateUserInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            updateUserInfoLabel.topAnchor.constraint(equalTo: updateUserInfoButton.bottomAnchor, constant: 10),
            updateUserInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            updateUserInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            otherUserHobbyButton.topAnchor.constraint(equalTo: updateUserInfoLabel.bottomAnchor, constant: 20),
            otherUserHobbyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            otherUserHobbyLabel.topAnchor.constraint(equalTo: otherUserHobbyButton.bottomAnchor, constant: 10),
            otherUserHobbyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            otherUserHobbyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            myHobbyButton.topAnchor.constraint(equalTo: otherUserHobbyLabel.bottomAnchor, constant: 20),
            myHobbyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            myHobbyLabel.topAnchor.constraint(equalTo: myHobbyButton.bottomAnchor, constant: 10),
            myHobbyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            myHobbyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc private func handleMyHobbyQuery() {
        guard let token = keychain.get("userToken") else {
            myHobbyLabel.text = "오류: 토큰이 없습니다. 다시 로그인해주세요."
            return
        }

        userService.getMyHobby(token: token) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let hobby):
                    self.myHobbyLabel.text = "내 취미: \(hobby)"
                case .failure(let error):
                    self.myHobbyLabel.text = "오류: 내 취미 조회 실패 - \(error.errorMessage)"
                }
            }
        }
    }

    @objc private func handleOtherUserHobbyQuery() {
        guard let token = keychain.get("userToken") else {
            otherUserHobbyLabel.text = "오류: 토큰이 없습니다. 다시 로그인해주세요."
            return
        }

        guard let userNo = userIdTextField.text, !userNo.isEmpty else {
            otherUserHobbyLabel.text = "오류: 유저 ID를 입력해주세요."
            return
        }

        userService.getOtherUserHobby(token: token, userNo: userNo) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let hobby):
                    self.otherUserHobbyLabel.text = "유저 \(userNo)의 취미: \(hobby)"
                case .failure(let error):
                    self.otherUserHobbyLabel.text = "오류: 다른 유저 취미 조회 실패 - \(error.errorMessage)"
                }
            }
        }
    }

    @objc private func handleUpdateUserInfo() {
        guard let token = keychain.get("userToken") else {
            updateUserInfoLabel.text = "오류: 토큰이 없습니다. 다시 로그인해주세요."
            return
        }

        let newPassword = passwordTextField.text
        let newHobby = hobbyTextField.text

        if (newPassword == nil || newPassword!.isEmpty) && (newHobby == nil || newHobby!.isEmpty) {
            updateUserInfoLabel.text = "오류: 변경할 비밀번호 또는 취미를 입력해주세요."
            return
        }

        userService.updateUserInfo(token: token, newPassword: newPassword, newHobby: newHobby) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.updateUserInfoLabel.text = "유저 정보가 성공적으로 변경되었습니다."
                case .failure(let error):
                    self.updateUserInfoLabel.text = "오류: 유저 정보 변경 실패 - \(error.errorMessage)"
                }
            }
        }
    }
}


struct QueryViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            QueryViewController()
        }
    }
}

// UIViewControllerPreview Helper
struct UIViewControllerPreview: UIViewControllerRepresentable {
    let viewController: () -> UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        return viewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
