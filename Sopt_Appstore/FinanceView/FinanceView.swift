//
//  FinanceView.swift
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
    
    private let appViewTitle_Top_Sub: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.text = "APP Store Editorが触接決めましたんです！"
        return label
    }()
    
    private let headScrollView = UIView()
    private let appViewTitle_Top = ApptitleView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setLayoutConstraints()
        setupContentViews()
        appViewTitle_Top.configure(title: "유료 순위")
    }
    

    
    private func setLayoutConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(headScrollView)
        view.addSubview(appViewTitle_Top)
        view.addSubview(appViewTitle_Top_Sub)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(300)
        }
        
        headScrollView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.height.equalToSuperview()
        }
        
        appViewTitle_Top.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
        
        appViewTitle_Top_Sub.snp.makeConstraints { make in
            make.top.equalTo(appViewTitle_Top.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(15)
        }
    }
    
    private func setupContentViews() {
        let numberOfViews = 3
        let viewWidth = UIScreen.main.bounds.width
        
        var previousSubview: UIView?
        
        for _ in 0..<numberOfViews {
            let cardView = HeadScrollView()
            headScrollView.addSubview(cardView)
            
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
