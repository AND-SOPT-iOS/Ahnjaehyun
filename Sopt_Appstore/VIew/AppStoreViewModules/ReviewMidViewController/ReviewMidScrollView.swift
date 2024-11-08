////
////  Reviw.swift
////  Sopt_Appstore
////
////  Created by Jaehyun Ahn on 10/31/24.
////
//

import UIKit
import SnapKit

class ReviewMidScrollView: UIScrollView {

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        

        
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        addReviewViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupScrollView()
        addReviewViews()
    }

    private func setupScrollView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        showsHorizontalScrollIndicator = false
    }

    private func addReviewViews() {
        for i in 1...5 {
            let reviewView = ReviewMidView()
            reviewView.configure(
                with: "리뷰 제목 \(i)",
                reviewDate: "9월 \(20 + i)일",
                reviewContent: "리뷰 내용 \(i)입니다. 업데이트에 대한 의견을 포함하고 있습니다.",
                developerResponseTitle: "개발자 답변",
                responseDate: "9월 \(22 + i)일",
                developerResponseContent: "안녕하세요. \(i)번 답변입니다."
            )
            
            reviewView.layer.cornerRadius = 20
                 reviewView.layer.masksToBounds = true
                 
            
            stackView.addArrangedSubview(reviewView)
            reviewView.snp.makeConstraints { make in
                make.width.equalTo(380)
                make.height.equalTo(240)
            }
        }
    }
}


#Preview{
    ReviewMidScrollView()
}
