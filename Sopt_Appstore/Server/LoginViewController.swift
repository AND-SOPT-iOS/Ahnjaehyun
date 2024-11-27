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
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
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
            self?.handleLoginResponse(result: result)
        }
    }

    
    func secureSaveToken(token: String) -> Bool {
        return keychain.set(token, forKey: "userToken")
    }
}


extension LoginViewController {
    private func handleLoginResponse(result: Result<String, NetworkError>) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch result {
            case .success(let token):
                self.handleLoginSuccess(token: token)
            case .failure(let error):
                self.handleLoginFailure(error: error)
            }
        }
    }
    
    private func handleLoginSuccess(token: String) {
        
        if secureSaveToken(token: token) {
            showAlert(title: "성공", message: "로그인 성공!") { [weak self] in
                guard let self = self else { return }
                let queryViewController = QueryViewController()
                self.navigationController?.pushViewController(queryViewController, animated: true)
            }
        } else {
            showAlert(title: "오류", message: "토큰 저장 실패")
        }
    }
    
    private func handleLoginFailure(error: NetworkError) {
        showAlert(title: "오류", message: "로그인 실패: \(error.errorMessage)")
    }
}
