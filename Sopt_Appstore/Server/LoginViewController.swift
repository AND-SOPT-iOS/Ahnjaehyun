//
//  LoginViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/8/24.
//


import UIKit
import KeychainSwift
import SnapKit

class LoginViewController: UIViewController {

    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "사용자 이름"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.addTarget(LoginViewController.self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()

    let keychain = KeychainSwift()
    let userService = UserService()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)

        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(usernameTextField)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }

    @objc private func handleLogin() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "오류", message: "사용자 이름과 비밀번호를 입력해주세요.")
            return
        }

        
        userService.login(username: username, password: password) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let token):
                    if self.secureSaveToken(token: token) {
                        self.showAlert(title: "성공", message: "로그인 성공!") {
                            let queryViewController = QueryViewController()
                            self.navigationController?.pushViewController(queryViewController, animated: true)
                        }
                    } else {
                        self.showAlert(title: "오류", message: "토큰 저장에 실패했습니다.")
                    }
                case .failure(let error):
                    self.showAlert(title: "오류", message: "로그인 실패: \(error.errorMessage)")
                }
            }
        }
    }

    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            completion?()
        }))
        present(alert, animated: true, completion: nil)
    }

    func secureSaveToken(token: String) -> Bool {
        return keychain.set(token, forKey: "userToken")
    }
}
