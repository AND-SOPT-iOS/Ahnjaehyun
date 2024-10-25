//
//  RatingViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//
import UIKit
import SnapKit

class RatingViewController: UIViewController {

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let ratingValueLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGray
        return label
    }()
    
    private let starRatingView: UILabel = {
        let label = UILabel()
        label.text = "★★★★★"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private let awardImageView: UIImageView = {
        let imageView = UIImageView()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24)
        imageView.image = UIImage(systemName: "star.fill", withConfiguration: symbolConfiguration)
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let awardLabel: UILabel = {
        let label = UILabel()
        label.text = "수상"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let appLabel: UILabel = {
        let label = UILabel()
        label.text = "앱"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let ageLabel2: UILabel = {
        let label = UILabel()
        label.text = "연령"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "4+"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGray
        return label
    }()
    
    private let ageTextLabel: UILabel = {
        let label = UILabel()
        label.text = "세"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let chartLabel: UILabel = {
        let label = UILabel()
        label.text = "#6"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGray
        return label
    }()
    
    private let chartTextLabel: UILabel = {
        let label = UILabel()
        label.text = "차트"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let chartLabel2: UILabel = {
        let label = UILabel()
        label.text = "금융"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let separatorLine1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let verticalSeparator1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let verticalSeparator2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let verticalSeparator3: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(separatorLine)
        separatorLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(20)
            make.height.equalTo(0.5)
        }

        view.addSubview(starRatingView)
        starRatingView.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-view.frame.width * 3.4 / 9)
            make.bottom.equalTo(separatorLine.snp.top).offset(-5)
        }

        view.addSubview(ratingValueLabel)
        ratingValueLabel.snp.makeConstraints { make in
            make.centerX.equalTo(starRatingView.snp.centerX)
            make.bottom.equalTo(starRatingView.snp.top).offset(-5)
        }

        view.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.centerX.equalTo(ratingValueLabel.snp.centerX)
            make.bottom.equalTo(ratingValueLabel.snp.top).offset(-5)
        }

        view.addSubview(separatorLine1)
        separatorLine1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(ratingLabel.snp.top).offset(-5)
            make.height.equalTo(0.5)
        }

        view.addSubview(verticalSeparator1)
        verticalSeparator1.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-view.frame.width * 2.3 / 9)
            make.bottom.equalTo(separatorLine.snp.top).offset(-20)
            make.width.equalTo(0.5)
            make.height.equalTo(30)
        }

        view.addSubview(appLabel)
        appLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-view.frame.width * 1.14 / 9)
            make.bottom.equalTo(separatorLine.snp.top).offset(-5)
        }

        view.addSubview(awardImageView)
        awardImageView.snp.makeConstraints { make in
            make.centerX.equalTo(appLabel.snp.centerX)
            make.bottom.equalTo(appLabel.snp.top).offset(-5)
        }

        view.addSubview(awardLabel)
        awardLabel.snp.makeConstraints { make in
            make.centerX.equalTo(appLabel.snp.centerX)
            make.bottom.equalTo(awardImageView.snp.top).offset(-5)
        }

        view.addSubview(verticalSeparator2)
        verticalSeparator2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(separatorLine.snp.top).offset(-20)
            make.width.equalTo(0.5)
            make.height.equalTo(30)
        }

        view.addSubview(ageTextLabel)
        ageTextLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(view.frame.width * 1.14 / 9)
            make.bottom.equalTo(separatorLine.snp.top).offset(-5)
        }

        view.addSubview(ageLabel)
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalTo(ageTextLabel.snp.centerX)
            make.bottom.equalTo(ageTextLabel.snp.top).offset(-5)
        }

        view.addSubview(ageLabel2)
        ageLabel2.snp.makeConstraints { make in
            make.centerX.equalTo(ageTextLabel.snp.centerX)
            make.bottom.equalTo(ageLabel.snp.top).offset(-5)
        }

        view.addSubview(verticalSeparator3)
        verticalSeparator3.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(view.frame.width * 2.3 / 9)
            make.bottom.equalTo(separatorLine.snp.top).offset(-20)
            make.width.equalTo(0.5)
            make.height.equalTo(30)
        }

        view.addSubview(chartLabel2)
        chartLabel2.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(view.frame.width * 3.4 / 9)
            make.bottom.equalTo(separatorLine.snp.top).offset(-5)
        }

        view.addSubview(chartLabel)
        chartLabel.snp.makeConstraints { make in
            make.centerX.equalTo(chartLabel2.snp.centerX)
            make.bottom.equalTo(chartLabel2.snp.top).offset(-5)
        }

        view.addSubview(chartTextLabel)
        chartTextLabel.snp.makeConstraints { make in
            make.centerX.equalTo(chartLabel2.snp.centerX)
            make.bottom.equalTo(chartLabel.snp.top).offset(-5)
        }
    }
}

#Preview {
    RatingViewController()
}
