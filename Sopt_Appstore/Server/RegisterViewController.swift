//
//  RegisterViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/8/24.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {

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

    private let hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "취미"
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("회원 등록", for: .normal)
        button.addTarget(RegisterViewController.self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()

    let userService = UserService()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(hobbyTextField)
        view.addSubview(registerButton)

        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(usernameTextField)
        }

        hobbyTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(usernameTextField)
        }

        registerButton.snp.makeConstraints { make in
            make.top.equalTo(hobbyTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }

    @objc private func handleRegister() {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let hobby = hobbyTextField.text, !hobby.isEmpty else {
            showAlert(title: "오류", message: "모든 필드를 입력해주세요.")
            return
        }

        userService.register(username: username, password: password, hobby: hobby) { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.showAlert(title: "성공", message: "회원등록 성공!") {
                        // 성공 시 로그인 뷰로 이동
                        let loginViewController = LoginViewController()
                        self.navigationController?.pushViewController(loginViewController, animated: true)
                    }
                case .failure(let error):
                    self.showAlert(title: "오류", message: "회원등록 실패: \(error.errorMessage)")
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
}
