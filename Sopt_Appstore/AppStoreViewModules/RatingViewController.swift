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

    private let ratingMid: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGray
        return label
    }()

    private let ratingBottom: UILabel = {
        let label = UILabel()
        label.text = "★★★★★"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()

   

    private let awardLabel: UILabel = {
        let label = UILabel()
        label.text = "수상"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    private let awardMid: UIImageView = {
        let imageView = UIImageView()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24)
        imageView.image = UIImage(systemName: "star.fill", withConfiguration: symbolConfiguration)
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let awardBottom: UILabel = {
        let label = UILabel()
        label.text = "앱"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()
    
    

    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "연령"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()

    private let ageMid: UILabel = {
        let label = UILabel()
        label.text = "4+"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGray
        return label
    }()

    private let ageBottom: UILabel = {
        let label = UILabel()
        label.text = "세"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()

    
    private let chartLabel: UILabel = {
        let label = UILabel()
        label.text = "금융"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()

    private let chartMid: UILabel = {
        let label = UILabel()
        label.text = "#6"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .systemGray
        return label
    }()

    private let chartBottom: UILabel = {
        let label = UILabel()
        label.text = "차트"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        return label
    }()

 
    
    
    private let separatorTopLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()

    private let separatorBottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()

    
    
    private let verticalSeparatorLeft: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()

    private let verticalSeparatorMid: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()

    private let verticalSeparatorRight: UIView = {
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

        view.addSubview(separatorTopLine)
        view.addSubview(separatorBottomLine)
        view.addSubview(ratingLabel)
        view.addSubview(ratingMid)
        view.addSubview(ratingBottom)
        view.addSubview(verticalSeparatorLeft)
        view.addSubview(awardBottom)
        view.addSubview(awardMid)
        view.addSubview(awardLabel)
        view.addSubview(verticalSeparatorMid)
        view.addSubview(ageBottom)
        view.addSubview(ageMid)
        view.addSubview(ageLabel)
        view.addSubview(verticalSeparatorRight)
        view.addSubview(chartLabel)
        view.addSubview(chartMid)
        view.addSubview(chartBottom)


        separatorTopLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview()
            make.height.equalTo(1)
        }

        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorTopLine.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }

        ratingMid.snp.makeConstraints { make in
            make.top.equalTo(ratingLabel.snp.bottom).offset(5)
            make.centerX.equalTo(ratingLabel)
        }

        
        ratingBottom.snp.makeConstraints { make in
            make.centerX.equalTo(ratingLabel)
            make.top.equalTo(ratingMid.snp.bottom).offset(5)
        }
        
        
        
        
        separatorBottomLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(ratingBottom.snp.bottom).offset(10)
            make.height.equalTo(1)
        }


        

        

        verticalSeparatorLeft.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-view.frame.width * 2.0 / 9)
            make.top.equalTo(separatorTopLine.snp.bottom).offset(30)
            make.width.equalTo(0.5)
            make.height.equalTo(30)
        }
        
        
        verticalSeparatorMid.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(separatorTopLine.snp.bottom).offset(30)
            make.width.equalTo(0.5)
            make.height.equalTo(30)
        }

        verticalSeparatorRight.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(view.frame.width * 2.0 / 9)
            make.top.equalTo(separatorTopLine.snp.bottom).offset(30)
            make.width.equalTo(0.5)
            make.height.equalTo(30)
        }
        
        
        
        awardLabel.snp.makeConstraints { make in
            make.centerY.equalTo(ratingLabel)
            make.centerX.equalToSuperview().offset(-view.frame.width * 0.98 / 9)
        }
        
        awardMid.snp.makeConstraints { make in
            make.centerY.equalTo(ratingMid)
            make.centerX.equalTo(awardLabel)
        }

        awardBottom.snp.makeConstraints { make in
            make.centerY.equalTo(ratingBottom)
            make.centerX.equalTo(awardLabel)
        }

        
        
        
        ageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(view.frame.width * 0.98 / 9)
            make.centerY.equalTo(ratingLabel)
        }
        
        ageMid.snp.makeConstraints { make in
            make.centerX.equalTo(ageLabel)
            make.centerY.equalTo(ratingMid)
        }

        ageBottom.snp.makeConstraints { make in
            make.centerX.equalTo(ageLabel)
            make.centerY.equalTo(ratingBottom)
        }

        
        chartLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-55)
            make.centerY.equalTo(ratingLabel)
        }

        chartMid.snp.makeConstraints { make in
            make.centerX.equalTo(chartLabel)
            make.centerY.equalTo(ratingMid)
        }

        chartBottom.snp.makeConstraints { make in
            make.centerX.equalTo(chartLabel)
            make.centerY.equalTo(ratingBottom)
        }



    }
}

    
    
    
    
    
#Preview {
    RatingViewController()
}
