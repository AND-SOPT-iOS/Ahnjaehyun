//
//  RootViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/28/24.
//

import UIKit
import SnapKit
import Then
import SwiftUI

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setButtons()
    }
    
    private func setButtons() {
        let swiftUIButton = createButton(
            title: "SwiftUI",
            color: .systemBlue,
            action: #selector(didTapButton1)
        )
        let appStoreButton = createButton(
            title: "App store",
            color: .systemGreen,
            action: #selector(didTapButton2)
        )
        let serverButton = createButton(
            title: "Server",
            color: .systemRed,
            action: #selector(didTapButton3)
        )
        
        let stackView = UIStackView(arrangedSubviews: [swiftUIButton, appStoreButton, serverButton]).then {
            $0.axis = .vertical
            $0.spacing = 20
            $0.alignment = .fill
        }
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    private func createButton(title: String, color: UIColor, action: Selector) -> UIButton {
        return UIButton(type: .system).then {
            $0.setTitle(title, for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = color
            $0.layer.cornerRadius = 10
            $0.addTarget(self, action: action, for: .touchUpInside)
            $0.snp.makeConstraints { make in
                make.height.equalTo(50)
            }
        }
    }
    
    @objc private func didTapButton1() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc private func didTapButton2() {
        navigationController?.pushViewController(TossViewController(), animated: true)
    }
    
    @objc private func didTapButton3() {
        let mainView = UIHostingController(rootView: MainView())
        navigationController?.pushViewController(mainView, animated: true)
    }
}
