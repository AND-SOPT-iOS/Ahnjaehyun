//
//  HeadScrollView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/31/24.
//

import UIKit
import SnapKit

class HeadScrollView: UIView {
    
    private let headScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(headScrollView)
        
        let numberOfCards = 3
        let viewWidth = UIScreen.main.bounds.width
        var previousCard: UIView?
        
        for _ in 0..<numberOfCards {
            let cardView = HeadScrollViewRow()
            headScrollView.addSubview(cardView)
            
            cardView.snp.makeConstraints { make in
                make.width.equalTo(viewWidth)
                make.height.equalToSuperview()
                
                if let previousCard = previousCard {
                    make.leading.equalTo(previousCard.snp.trailing)
                } else {
                    make.leading.equalToSuperview()
                }
            }
            previousCard = cardView
        }
        
        previousCard?.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
        }
    }
    
    private func setupConstraints() {
        headScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
