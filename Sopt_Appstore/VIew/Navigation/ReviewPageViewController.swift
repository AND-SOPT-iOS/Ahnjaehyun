//
//  r.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/25/24.
//

import Foundation
import UIKit
import SnapKit

class ReviewPageViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "리뷰 페이지"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
