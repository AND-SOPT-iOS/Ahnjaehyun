//
//  RatingViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//


import UIKit
import SnapKit

class RatingViewController: UIViewController {

    private let scrollView = RatingScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
                      make.height.equalTo(200)
            
        }
    }
}

#Preview {
    RatingViewController()
}
