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

    private let hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "취미"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.addTarget(LoginViewController.self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()

    let keychain = KeychainSwift()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(hobbyTextField)
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
        
        hobbyTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(usernameTextField)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(hobbyTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }

    @objc private func handleLogin() {
        //if 3 filed empty
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let hobby = hobbyTextField.text, !hobby.isEmpty else {
            showAlert(title: "오류", message: "모든 필드를 입력해주세요.")
            return
        }
        
        let loginRequest = RegisterRequest(username: username, password: password, hobby: hobby)
        simulateLogin(request: loginRequest) { [weak self] response in
            guard let self = self else { return }
            
            if let token = response?.token {
                if self.secureSaveToken(token: token) {
                    self.showAlert(title: "성공", message: "로그인 성공!") {
                        // 파이넨스 뷰로 이동
                        let financeViewController = FinanceView()
                        self.navigationController?.pushViewController(financeViewController, animated: true)
                    }
                } else {
                    self.showAlert(title: "오류", message: "토큰 저장에 실패했습니다.")
                }
            } else {
                self.showAlert(title: "오류", message: "잘못된 사용자 이름 또는 비밀번호입니다.")
            }
        }
    }

    private func simulateLogin(request: RegisterRequest, completion: @escaping (LoginResponse?) -> Void) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            if request.username == "test" && request.password == "1234" {
                let response = LoginResponse(token: "12345679")
                completion(response)
            } else {
                completion(nil)
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

    
    func saveToken(token: String) {
        keychain.set(token, forKey: "userToken")
    }
    
    //토큰을 keychain으로부터 가져옴
    func getToken() -> String? {
        return keychain.get("userToken")
    }

    //토큰삭제
    func deleteToken() {
        keychain.delete("userToken")
    }
    
    //토큰 오류 처리 헨들러
    func secureSaveToken(token: String) -> Bool {
        let isSaved = keychain.set(token, forKey: "userToken")
        if isSaved {
            return true
        } else {
            print("Failed to save token")
            return false
        }
    }
}
