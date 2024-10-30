//
//  HorizontalScrollViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//

import UIKit
import SnapKit

class HorizontalScrollViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setLayoutConstraints()

    }
    
    private func setLayoutConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(200)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    

}

#Preview {
    HorizontalScrollViewController()
}
