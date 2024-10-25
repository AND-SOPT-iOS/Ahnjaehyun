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

        view.addSubview(separatorTopLine)
        view.addSubview(separatorBottomLine)
        view.addSubview(ratingLabel)
        view.addSubview(ratingValueLabel)
        view.addSubview(starRatingView)
        view.addSubview(verticalSeparator1)
        view.addSubview(appLabel)
        view.addSubview(awardImageView)
        view.addSubview(awardLabel)
        view.addSubview(verticalSeparator2)
        view.addSubview(ageTextLabel)
        view.addSubview(ageLabel)
        view.addSubview(ageLabel2)
        view.addSubview(verticalSeparator3)
        view.addSubview(chartLabel2)
        view.addSubview(chartLabel)
        view.addSubview(chartTextLabel)


        separatorTopLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(20)
            make.height.equalTo(0.5)
        }

        separatorBottomLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(separatorTopLine.snp.top).offset(-10)
            make.height.equalTo(3)
        }

        starRatingView.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-view.frame.width * 3.4 / 9)
            make.bottom.equalTo(separatorTopLine.snp.top).offset(-5)
        }

        ratingValueLabel.snp.makeConstraints { make in
            make.centerX.equalTo(starRatingView.snp.centerX)
            make.bottom.equalTo(starRatingView.snp.top).offset(-5)
        }

        ratingLabel.snp.makeConstraints { make in
            make.centerX.equalTo(ratingValueLabel.snp.centerX)
            make.bottom.equalTo(ratingValueLabel.snp.top).offset(-5)
        }

        verticalSeparator1.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-view.frame.width * 2.3 / 9)
            make.bottom.equalTo(separatorTopLine.snp.top).offset(-20)
            make.width.equalTo(0.5)
            make.height.equalTo(30)
        }

        appLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-view.frame.width * 1.14 / 9)
            make.bottom.equalTo(separatorTopLine.snp.top).offset(-5)
        }

        awardImageView.snp.makeConstraints { make in
            make.centerX.equalTo(appLabel.snp.centerX)
            make.bottom.equalTo(appLabel.snp.top).offset(-5)
        }

        awardLabel.snp.makeConstraints { make in
            make.centerX.equalTo(appLabel.snp.centerX)
            make.bottom.equalTo(awardImageView.snp.top).offset(-5)
        }

        verticalSeparator2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(separatorTopLine.snp.top).offset(-20)
            make.width.equalTo(0.5)
            make.height.equalTo(30)
        }

        ageTextLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(view.frame.width * 1.14 / 9)
            make.bottom.equalTo(separatorTopLine.snp.top).offset(-5)
        }

        ageLabel.snp.makeConstraints { make in
            make.centerX.equalTo(ageTextLabel.snp.centerX)
            make.bottom.equalTo(ageTextLabel.snp.top).offset(-5)
        }

        ageLabel2.snp.makeConstraints { make in
            make.centerX.equalTo(ageTextLabel.snp.centerX)
            make.bottom.equalTo(ageLabel.snp.top).offset(-5)
        }

        verticalSeparator3.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(view.frame.width * 2.3 / 9)
            make.bottom.equalTo(separatorTopLine.snp.top).offset(-20)
            make.width.equalTo(0.5)
            make.height.equalTo(30)
        }

        chartLabel2.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(view.frame.width * 3.4 / 9)
            make.bottom.equalTo(separatorTopLine.snp.top).offset(-5)
        }

        chartLabel.snp.makeConstraints { make in
            make.centerX.equalTo(chartLabel2.snp.centerX)
            make.bottom.equalTo(chartLabel2.snp.top).offset(-5)
        }

        chartTextLabel.snp.makeConstraints { make in
            make.centerX.equalTo(chartLabel2.snp.centerX)
            make.bottom.equalTo(chartLabel.snp.top).offset(-5)
        }
    }
}

#Preview {
    RatingViewController()
}
