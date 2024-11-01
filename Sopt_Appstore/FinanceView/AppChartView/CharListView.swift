//
//  CharListView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/1/24.
//


import UIKit
import SnapKit
import SwiftUI

class ChartListView: UIViewController {
    
    private let chartViewController = ChartViewController()
    private let myTabBarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = .all
        extendedLayoutIncludesOpaqueBars = true
            
        view.backgroundColor = .black
        
        setupNavigationBar()
        setupTabBarController()
        setupChartViewController()
    }
    
    private func setupNavigationBar() {
        title = "Chart"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .systemBlue
        
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
        backButtonView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backButtonTapped))
        backButtonView.addGestureRecognizer(tapGesture)
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        let finacaViewController = FinanceView()
        navigationController?.pushViewController(finacaViewController, animated: true)
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

    private func setupChartViewController() {
        addChild(chartViewController)
        view.addSubview(chartViewController.view)
        chartViewController.didMove(toParent: self)
        
        chartViewController.view.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view)
            make.bottom.equalTo(myTabBarController.tabBar.snp.top)
        }
    }
}

struct ChartListViewPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navController = UINavigationController(rootViewController: ChartListView())
        return navController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}

#Preview {
    ChartListViewPreview()
}
