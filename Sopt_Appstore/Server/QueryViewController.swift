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
    
    private let userIdTextField = UITextField().then {
        $0.placeholder = "유저 번호 입력"
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호 입력"
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
    }
    
    private let hobbyTextField = UITextField().then {
        $0.placeholder = "취미 입력"
        $0.borderStyle = .roundedRect
    }
    
    private let myHobbyButton = UIButton(type: .system).then {
        $0.setTitle("내 취미 조회", for: .normal)
    }
    
    private let myHobbyLabel = UILabel().then {
        $0.text = "내 취미 조회 결과"
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .darkGray
    }
    
    private let otherUserHobbyButton = UIButton(type: .system).then {
        $0.setTitle("다른 유저 취미 조회", for: .normal)
    }
    
    private let otherUserHobbyLabel = UILabel().then {
        $0.text = "다른 유저 취미 조회 결과"
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .darkGray
    }
    
    private let updateUserInfoButton = UIButton(type: .system).then {
        $0.setTitle("유저 정보 변경", for: .normal)
    }
    
    private let updateUserInfoLabel = UILabel().then {
        $0.text = "유저 정보 변경 결과"
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .darkGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        myHobbyButton.addTarget(self, action: #selector(handleMyHobbyQuery), for: .touchUpInside)
        otherUserHobbyButton.addTarget(self, action: #selector(handleOtherUserHobbyQuery), for: .touchUpInside)
        updateUserInfoButton.addTarget(self, action: #selector(handleUpdateUserInfo), for: .touchUpInside)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        [userIdTextField, passwordTextField, hobbyTextField, myHobbyButton, myHobbyLabel,
         otherUserHobbyButton, otherUserHobbyLabel, updateUserInfoButton, updateUserInfoLabel].forEach {
            view.addSubview($0)
        }
        
        userIdTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        otherUserHobbyButton.snp.makeConstraints {
            $0.top.equalTo(userIdTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        otherUserHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(otherUserHobbyButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(otherUserHobbyLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        updateUserInfoButton.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        updateUserInfoLabel.snp.makeConstraints {
            $0.top.equalTo(updateUserInfoButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        myHobbyButton.snp.makeConstraints {
            $0.top.equalTo(updateUserInfoLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        myHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(myHobbyButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
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
            showAlert(message: "오류: 토큰이 없습니다. 다시 로그인해주세요.")
            return
        }
        
        guard let userNo = userIdTextField.text, !userNo.isEmpty else {
            showAlert(message: "오류: 유저 ID를 입력해주세요.")
            return
        }
        
        userService.getOtherUserHobby(token: token, userNo: userNo) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let hobby):
                    let message = "\(userNo)님의 취미는 \(hobby)입니다."
                    self.showAlert(message: message)
                case .failure(let error):
                    self.showAlert(message: "오류: 다른 유저 취미 조회 실패 - \(error.errorMessage)")
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
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
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
