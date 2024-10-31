//
//  FinanceView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//



import UIKit
import SnapKit

class FinanceView: UIViewController {
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()

    private let appViewTitle_Top_Sub: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.text = "APP Store Editorが触接決めましたんです！"
        return label
    }()
    
    private let headScrollView = HeadScrollView()
    private let appViewTitle_Top = ApptitleView()
    private let appViewTitle_Mid = ApptitleView()
    private let appViewTitle_Bot = ApptitleView()
    
    private let appHorizontalScrollView_Top = AppHorizontalScrollView()
    private let appHorizontalScrollView_Mid = AppHorizontalScrollView()
    private let appHorizontalScrollView_Bot = AppHorizontalScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupScrollView()
        setLayoutConstraints()
        
        appViewTitle_Top.configure(title: "필수 금융 앱")
        appViewTitle_Mid.configure(title: "유료 순위")
        appViewTitle_Bot.configure(title: "무료 순위")
    }
    
    private func setupScrollView() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
        }
    }
    
    private func setLayoutConstraints() {
        containerView.addSubview(headScrollView)
        containerView.addSubview(appViewTitle_Top)
        containerView.addSubview(appViewTitle_Top_Sub)
        containerView.addSubview(appHorizontalScrollView_Top.view)
        
        containerView.addSubview(appViewTitle_Mid)
        containerView.addSubview(appHorizontalScrollView_Mid.view)
        
        containerView.addSubview(appViewTitle_Bot)
        containerView.addSubview(appHorizontalScrollView_Bot.view)
        
        
        headScrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(300)
        }
        
        appViewTitle_Top.snp.makeConstraints { make in
            make.top.equalTo(headScrollView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
        
        appViewTitle_Top_Sub.snp.makeConstraints { make in
            make.top.equalTo(appViewTitle_Top.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(15)
        }
        
        appHorizontalScrollView_Top.view.snp.makeConstraints { make in
            make.top.equalTo(appViewTitle_Top_Sub.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)         }
        
        appViewTitle_Mid.snp.makeConstraints { make in
            make.top.equalTo(appHorizontalScrollView_Top.view.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
        
        appHorizontalScrollView_Mid.view.snp.makeConstraints { make in
            make.top.equalTo(appViewTitle_Mid.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }
        
        appViewTitle_Bot.snp.makeConstraints { make in
            make.top.equalTo(appHorizontalScrollView_Mid.view.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
        
        appHorizontalScrollView_Bot.view.snp.makeConstraints { make in
            make.top.equalTo(appViewTitle_Bot.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
            make.bottom.equalToSuperview()
            
        }
    }
}

#Preview {
    FinanceView()
}
