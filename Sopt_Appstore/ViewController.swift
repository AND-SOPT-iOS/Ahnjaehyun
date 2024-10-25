//
//  ViewController.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/24/24.
//
import UIKit
import SnapKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let headerViewController = HeaderViewController()
    let ratingViewController = RatingViewController()
    let updateInfoViewController = UpdateInfoViewController()
    let previewViewController = PreviewViewController()
    let infoViewController = InfoViewController()
    let reviewTopViewController = ReviewTopViewController()
    let reviewMidViewController = ReviewMidViewController()
    let reviewBottomViewController = ReviewBottomViewController()


    

    let scrollView = UIScrollView()
    let contentView = UIView()

    let myTabBarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        setupNavigationBar()

        setupTabBarController()

        setupScrollView()
    }

    // MARK: - 네비게이션 바 설정
    func setupNavigationBar() {
        // 커스텀 뷰로 "< 검색" 버튼 구성
        let backButtonView = UIView()
        let backImageView = UIImageView(image: UIImage(systemName: "chevron.left"))
        let backLabel = UILabel()

        // < 아이콘 설정
        backImageView.tintColor = .blue
        backImageView.contentMode = .scaleAspectFit
        
        // 검색 텍스트 라벨 설정
        backLabel.text = "검색"
        backLabel.textColor = .blue
        backLabel.font = UIFont.systemFont(ofSize: 17)

        // 스택뷰로 아이콘과 라벨을 함께 배치
        let stackView = UIStackView(arrangedSubviews: [backImageView, backLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        
        backButtonView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        // 커스텀 뷰로 UIBarButtonItem 생성 및 추가
        let backButton = UIBarButtonItem(customView: backButtonView)
        navigationItem.leftBarButtonItem = backButton

        // 네비게이션 바 스타일 초기 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground() // 투명 배경 설정
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - 탭바 설정
    func setupTabBarController() {
        scrollView.delegate = self // 스크롤 이벤트 처리?


        let todayVC = UIViewController()
        let gameVC = UIViewController()
        let appVC = UIViewController()
        let arcadeVC = UIViewController()
        let searchVC = UIViewController()

        // 각 탭바 아이템 설정
        todayVC.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "house.fill"), tag: 0)
        gameVC.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "gamecontroller.fill"), tag: 1)
        appVC.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "app.fill"), tag: 2)
        arcadeVC.tabBarItem = UITabBarItem(title: "아케이드", image: UIImage(systemName: "cube.box.fill"), tag: 3)
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)

        
        myTabBarController.viewControllers = [todayVC, gameVC, appVC, arcadeVC, searchVC]

        // 탭바 외형
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)

        // 탭바 스타일
        myTabBarController.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            myTabBarController.tabBar.scrollEdgeAppearance = appearance
        }

        // 탭바 아이템 색상
        myTabBarController.tabBar.tintColor = .white
        myTabBarController.tabBar.unselectedItemTintColor = .lightGray

        // 탭바를 현재 ViewController에 추가
        addChild(myTabBarController)
        view.addSubview(myTabBarController.view)
        myTabBarController.didMove(toParent: self)

        // 탭바의 위치 및 크기 설정
        myTabBarController.view.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view)
            make.height.equalTo(50)
        }
    }

    // MARK: - ScrollView 설정
    func setupScrollView() {

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(myTabBarController.tabBar.snp.top)
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1700)
        }

        // HeaderViewController 추가 및 레이아웃 설정
        addChild(headerViewController)
        contentView.addSubview(headerViewController.view)
        headerViewController.didMove(toParent: self)

        headerViewController.view.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView).offset(20)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.4)
        }
        
        
        addChild(ratingViewController)
        contentView.addSubview(ratingViewController.view)
        ratingViewController.didMove(toParent: self)

        ratingViewController.view.snp.makeConstraints { make in
            make.top.equalTo(headerViewController.view.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.3)
        }
        
        addChild(updateInfoViewController)
        contentView.addSubview(updateInfoViewController.view)
        updateInfoViewController.didMove(toParent: self)
        
        updateInfoViewController.view.snp.makeConstraints { make in
            make.top.equalTo(ratingViewController.view.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.35)
        }
        
        addChild(previewViewController)
        contentView.addSubview(previewViewController.view)
        previewViewController.didMove(toParent: self)
        
        previewViewController.view.snp.makeConstraints { make in
            make.top.equalTo(updateInfoViewController.view.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.85)
        }
        
        addChild(infoViewController)
        contentView.addSubview(infoViewController.view)
        infoViewController.didMove(toParent: self)

        infoViewController.view.snp.makeConstraints { make in
            make.top.equalTo(previewViewController.view.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.35)
        }
        
        addChild(reviewTopViewController)
        contentView.addSubview(reviewTopViewController.view)
        reviewTopViewController.didMove(toParent: self)

        reviewTopViewController.view.snp.makeConstraints { make in
            make.top.equalTo(infoViewController.view.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.4)
        }


        addChild(reviewMidViewController)
        contentView.addSubview(reviewMidViewController.view)
      
        reviewMidViewController.view.snp.makeConstraints { make in
            make.top.equalTo(reviewTopViewController.view.snp.bottom).offset(20)
            make.leading.equalTo(contentView).offset(20)
            make.trailing.equalTo(contentView).offset(-20) // trailing은 반대로 설정하여 양쪽에서 20씩 여백

            make.height.equalTo(contentView.snp.width).multipliedBy(0.7)
            
        }
        reviewMidViewController.didMove(toParent: self)
        reviewMidViewController.view.layer.cornerRadius = 20
        reviewMidViewController.view.clipsToBounds = true

        
        addChild(reviewBottomViewController)
        contentView.addSubview(reviewBottomViewController.view)
        reviewBottomViewController.didMove(toParent: self)

        reviewBottomViewController.view.snp.makeConstraints { make in
            make.top.equalTo(reviewMidViewController.view.snp.bottom).offset(20)
            make.leading.trailing.equalTo(contentView)
            make.height.equalTo(150)
        }

        
    }

    // MARK: - 스크롤 이벤트 처리
    @objc func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        
        if offset > 100 {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 0.9)
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    let navController = UINavigationController(rootViewController: ViewController())
    return navController
}
