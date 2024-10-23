//
//  ViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // ScrollView와 ContentView 선언
    let scrollView = UIScrollView()
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupScrollView()
    }

    func setupScrollView() {
        // ScrollView 추가
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)  // 전체 화면에 꽉 차게
        }

        // ScrollView에 contentView 추가
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()  // ScrollView 크기에 맞추기
            make.width.equalToSuperview()  // 수직 스크롤이므로 너비는 고정
            make.height.equalTo(1500)  // 임의로 contentView의 높이를 설정
        }
    }
}

#Preview{
    ViewController()
}
