//
//  ViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//


import UIKit
import SnapKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupScrollView()

        let headerVC = HeaderViewController()
        addChild(headerVC)
        contentView.addSubview(headerVC.view)
        headerVC.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
        headerVC.didMove(toParent: self)

        let ratingVC = RatingViewController()
        addChild(ratingVC)
        contentView.addSubview(ratingVC.view)
        ratingVC.view.snp.makeConstraints { make in
            make.top.equalTo(headerVC.view.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        ratingVC.didMove(toParent: self)
    }

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}

#Preview {
    ViewController()
}
