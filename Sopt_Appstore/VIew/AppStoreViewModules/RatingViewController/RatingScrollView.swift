//
//  RatingScrollView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/31/24.
//

import UIKit
import SnapKit

class RatingScrollView: UIScrollView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    
    
     private let separatorTopLine: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGray
         return view
     }()
     
    
     private let separatorBtmLine: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGray
         return view
     }()
     
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addRatingViews()

        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addRatingViews()

        setupScrollView()
    }
    
    
    
    private func setupScrollView() {
        addSubview(stackView)
        addSubview(separatorTopLine)
        addSubview(separatorBtmLine)

        separatorTopLine.snp.makeConstraints { make in
            make.bottom.equalTo(stackView.snp.top).offset(-10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(5)
        }

        separatorBtmLine.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(5)
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        
        contentSize = CGSize(width: stackView.frame.width, height: frame.height)
        showsHorizontalScrollIndicator = false
    }

    
    private func addRatingViews() {
        let ratingData = [
            ("1.2만개의 평가", "4.2", "★★★★☆"),
            ("수상", "⭐", "앱"),
            ("연령", "+4", "세"),
            ("금융", "#6", "차트"),
            ("Sopt", "iOS", "안재현")
        ]
        
        for data in ratingData {
                  let ratingView = RatingViews()
                  ratingView.configure(ratingText: data.0, ratingValue: data.1, starText: data.2)
                  stackView.addArrangedSubview(ratingView)
                  
                  ratingView.snp.makeConstraints { make in
                      make.width.equalTo(80)
                      make.height.equalToSuperview()

                  }
              }
              
             
        
        
        
    }
}


