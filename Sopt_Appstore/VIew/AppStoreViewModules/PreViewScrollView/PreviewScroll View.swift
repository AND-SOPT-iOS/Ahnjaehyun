//
//  PreviewScroll.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/31/24.
//
import UIKit
import SnapKit

class PreviewScrollView: UIView {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    
    private let imageNames = ["tossPreview1", "tossPreview2", "tossPreview3", "tossPreview4"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupImages()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollView.showsHorizontalScrollIndicator = false
        
        
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 30
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    private func setupImages() {
        for imageName in imageNames {
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 30
            
            
            imageView.snp.makeConstraints { make in
                make.width.equalTo(270)
                make.height.equalTo(550)
            }
            
            
            
            stackView.addArrangedSubview(imageView)
        }
    }
}

#Preview {
    PreviewScrollView()
}
