//
//  HorizontalScrollViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//

import UIKit
import SnapKit

class HorizontalScrollViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI() // 전체 UI 설정
    }
    
    private func setUI() {
        setupScrollView()
        setupComponents()
    }
    
    // 스크롤뷰 설정
    private func setupScrollView() {
        scrollView.showsHorizontalScrollIndicator = false
        // 페이징 효과 설정
        scrollView.isPagingEnabled = true
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(200)
        }
        
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    // 콘텐츠 설정
    private func setupComponents() {
        let numberOfViews = 5
        let viewWidth = UIScreen.main.bounds.width * 0.9
        //좌우 여백
        let spacing = UIScreen.main.bounds.width * 0.05

        var previousSubview: UIView?
        
        for i in 0..<numberOfViews {
            let subview = UIView()
            subview.backgroundColor = UIColor(
                hue: CGFloat(i) / CGFloat(numberOfViews),
                saturation: 0.8,
                brightness: 0.9,
                alpha: 1.0
            )
            contentView.addSubview(subview)
            
            
            subview.snp.makeConstraints { make in
                make.width.equalTo(viewWidth)
                make.height.equalToSuperview()
                
                if let previousSubview = previousSubview {
                    make.leading.equalTo(previousSubview.snp.trailing).offset(spacing * 2)
                } else {
                    make.leading.equalToSuperview().offset(spacing)
                }
            }
            previousSubview = subview
        }
        
        // 마지막 서브뷰 오른쪽 여백 설정
        previousSubview?.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-spacing)
        }
    }
}

#Preview {
    HorizontalScrollViewController()
}
