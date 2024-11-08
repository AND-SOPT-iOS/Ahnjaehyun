//
//  ReviewMidViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/31/24.
//

import UIKit
import SnapKit

class ReviewMidViewController: UIViewController {

    private let scrollView = ReviewMidScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

#Preview {
    ReviewMidViewController()
}
