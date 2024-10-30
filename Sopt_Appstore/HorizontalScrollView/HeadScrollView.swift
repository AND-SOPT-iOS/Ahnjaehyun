//
//  test.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//



import UIKit
import SnapKit



class HeadScrollView: UIView {
    
    
    private let describeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "新しい経験"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .systemBlue
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fortune City - A Finance App"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "게임을 하듯 관리하는 가계부"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "scrollBackground") // 메인 이미지 설정
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let overlayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tictokIcon") // 겹쳐질 이미지 설정
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "抖音"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private let subDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "抖音是一款流行的短视频应用程序."
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    
    let actionButton = UIButton.makeActionButton()
    let purchaseLabel = UILabel.makePurchaseLabel()
    
    
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        backgroundColor = .black
        addSubview(describeTitleLabel)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)
        addSubview(mainImageView)
        



        mainImageView.addSubview(overlayImageView)
        mainImageView.addSubview(subDescriptionLabel)
        mainImageView.addSubview(descriptionLabel)
        mainImageView.addSubview(actionButton)
        mainImageView.addSubview(purchaseLabel)

      
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {

        describeTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.trailing.equalToSuperview().inset(15)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(200)
        }
        
        overlayImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.height.equalTo(40)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(overlayImageView.snp.top).offset(5)
            make.leading.equalTo(overlayImageView.snp.trailing).offset(5)
        }
        
        subDescriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(overlayImageView.snp.bottom).offset(-5)
            make.leading.equalTo(overlayImageView.snp.trailing).offset(5)
        }
        
        actionButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(overlayImageView.snp.top)
        }
        
        purchaseLabel.snp.makeConstraints { make in
            make.top.equalTo(actionButton.snp.bottom).offset(3)
            make.centerX.equalTo(actionButton.snp.centerX).offset(0)
        }
        

        }
    

}

#Preview{
    HeadScrollView()
}
