//
//  PreviewViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//
import UIKit
import SnapKit

class PreviewViewController: UIViewController {

    private let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "preview_toss")
        //이미지 뷰의 크기와 비율에 맞춰 표시
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "미리 보기"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    
    private let iphoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "iphone")
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private let iphoneLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    private func setupUI() {
            // 모든 뷰가 동일한 부모 뷰에 추가되어야 함
            view.addSubview(titleLabel)
            view.addSubview(previewImageView)
            view.addSubview(iphoneImage)
            view.addSubview(iphoneLabel)

            // 제약 설정
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
                make.leading.equalToSuperview().offset(20)
            }

            previewImageView.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(20)
                make.leading.equalTo(titleLabel.snp.leading)
                make.trailing.equalToSuperview().offset(-20)
                make.height.equalTo(300)
            }
            
            iphoneImage.snp.makeConstraints { make in
                make.top.equalTo(previewImageView.snp.bottom).offset(10)
                make.leading.equalTo(titleLabel.snp.leading)
                make.width.height.equalTo(20)
            }
            
            iphoneLabel.snp.makeConstraints { make in
                make.centerY.equalTo(iphoneImage.snp.centerY)
                make.leading.equalTo(iphoneImage.snp.trailing).offset(5)
            }

    }
    
}

#Preview {
    PreviewViewController()
}
