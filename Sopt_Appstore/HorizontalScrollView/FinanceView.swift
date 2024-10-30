//
//  HorizontalScrollViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//
import UIKit
import SnapKit

class FinanceView: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private let contentView = UIView()
    
    override func viewDidLoad() {
         super.viewDidLoad()
         setLayoutConstraints()
         setupContentViews()
     }
     
     private func setLayoutConstraints() {
         view.addSubview(scrollView)
         scrollView.addSubview(contentView)
         
         scrollView.snp.makeConstraints { make in
             make.leading.trailing.equalToSuperview()
             make.top.bottom.equalToSuperview()
         }
         
         contentView.snp.makeConstraints { make in
             make.edges.equalToSuperview()
             make.height.equalToSuperview() // ScrollView의 높이와 동일하게 설정
         }
     }
     
     private func setupContentViews() {
         
         let numberOfViews = 3
         let viewWidth = UIScreen.main.bounds.width
         
         var previousSubview: UIView?
         
         for _ in 0..<numberOfViews {
             let cardView = HeadScrollView()
             contentView.addSubview(cardView)
             
             cardView.snp.makeConstraints { make in
                 make.width.equalTo(viewWidth)
                 make.height.equalToSuperview()
                 
                 if let previousSubview = previousSubview {
                     make.leading.equalTo(previousSubview.snp.trailing)
                 } else {
                     make.leading.equalToSuperview()
                     
                     
                 }
             }
             previousSubview = cardView
         }
         
         previousSubview?.snp.makeConstraints { make in
             make.trailing.equalToSuperview()
         }
     }
}

#Preview {
    FinanceView()
}
