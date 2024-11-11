//
//  FinanceView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/30/24.
//

import UIKit
import SnapKit

class FinanceViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    
    private let appViewTitle_Top_Sub: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.text = "APP Store Editorが触接決めましたんです！"
        return label
    }()
    
    
    private let headScrollView = HeadScrollView()
    private let appViewTitle_Top = ApptitleView()
    private let appViewTitle_Mid = ApptitleView()
    private let appViewTitle_Bot = ApptitleView()
    
    private let appHorizontalScrollView_Top = AppHorizontalScrollView()
    private let appHorizontalScrollView_Mid = AppHorizontalScrollView()
    private let appHorizontalScrollView_Bot = AppHorizontalScrollView()
    
    private let myTabBarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        
        setupTabBarController()
        setupScrollView()
        setLayoutConstraints()
        setupNavigationBar()
        
        appViewTitle_Top.configure(title: "필수 금융 앱")
        appViewTitle_Mid.configure(title: "유료 순위")
        appViewTitle_Bot.configure(title: "무료 순위")
        
        appViewTitle_Bot.onArrowButtonTapped = { [weak self] in
                    guard let self = self else { return }
                    let chartListViewController = ChartListView()
                    self.navigationController?.pushViewController(chartListViewController, animated: true)
                }
    }
    
    private func setupNavigationBar() {
        let backButtonView = UIView()
        let backImageView = UIImageView(image: UIImage(systemName: "chevron.left"))
        let backLabel = UILabel()
        
        backImageView.tintColor = .systemBlue
        backImageView.contentMode = .scaleAspectFit
        
        backLabel.text = "검색"
        backLabel.textColor = .systemBlue
        backLabel.font = UIFont.systemFont(ofSize: 17)
        
        let stackView = UIStackView(arrangedSubviews: [backImageView, backLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        
        backButtonView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            
            make.edges.equalToSuperview()
        }
        
        let backButton = UIBarButtonItem(customView: backButtonView)
        navigationItem.leftBarButtonItem = backButton
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTabBarController() {
        let todayVC = UIViewController()
        let gameVC = UIViewController()
        let appVC = UIViewController()
        let arcadeVC = UIViewController()
        let searchVC = UIViewController()

        todayVC.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "house.fill"), tag: 0)
        gameVC.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "gamecontroller.fill"), tag: 1)
        appVC.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "app.fill"), tag: 2)
        arcadeVC.tabBarItem = UITabBarItem(title: "아케이드", image: UIImage(systemName: "cube.box.fill"), tag: 3)
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        
        myTabBarController.viewControllers = [todayVC, gameVC, appVC, arcadeVC, searchVC]
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        myTabBarController.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            myTabBarController.tabBar.scrollEdgeAppearance = appearance
        }
        
        myTabBarController.tabBar.tintColor = .white
        myTabBarController.tabBar.unselectedItemTintColor = .lightGray
        
        addChild(myTabBarController)
        view.addSubview(myTabBarController.view)
        myTabBarController.didMove(toParent: self)
        
        myTabBarController.view.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view)
            make.height.equalTo(50)
        }
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(myTabBarController.tabBar.snp.top)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
        }
    }
    
    private func setLayoutConstraints() {
        containerView.addSubview(headScrollView)
        containerView.addSubview(appViewTitle_Top)
        containerView.addSubview(appViewTitle_Top_Sub)
        containerView.addSubview(appHorizontalScrollView_Top.view)
        
        containerView.addSubview(appViewTitle_Mid)
        containerView.addSubview(appHorizontalScrollView_Mid.view)
        
        containerView.addSubview(appViewTitle_Bot)
        containerView.addSubview(appHorizontalScrollView_Bot.view)
        
        headScrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(300)
        }
        
        appViewTitle_Top.snp.makeConstraints { make in
            make.top.equalTo(headScrollView.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
        
        appViewTitle_Top_Sub.snp.makeConstraints { make in
            make.top.equalTo(appViewTitle_Top.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.height.equalTo(15)
        }
        
        appHorizontalScrollView_Top.view.snp.makeConstraints { make in
            make.top.equalTo(appViewTitle_Top_Sub.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }
        
        appViewTitle_Mid.snp.makeConstraints { make in
            make.top.equalTo(appHorizontalScrollView_Top.view.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
        
        appHorizontalScrollView_Mid.view.snp.makeConstraints { make in
            make.top.equalTo(appViewTitle_Mid.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }
        
        appViewTitle_Bot.snp.makeConstraints { make in
            make.top.equalTo(appHorizontalScrollView_Mid.view.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
        
        appHorizontalScrollView_Bot.view.snp.makeConstraints { make in
            make.top.equalTo(appViewTitle_Bot.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
            make.bottom.equalToSuperview()
        }
    }
}

#Preview {
    
    let navController = UINavigationController(rootViewController: FinanceViewController())
    return navController
    
}
