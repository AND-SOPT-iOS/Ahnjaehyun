//
//  TapbarView.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 10/25/24.
//

import Foundation
import UIKit
import SnapKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 각 탭별 네비게이션 컨트롤러 설정
        let todayVC = createNavController(viewController: HeaderViewController1(), title: "투데이", image: UIImage(systemName: "house.fill")!)
        let gameVC = createNavController(viewController: RatingViewController1(), title: "게임", image: UIImage(systemName: "gamecontroller.fill")!)
        let appVC = createNavController(viewController: UIViewController(), title: "앱", image: UIImage(systemName: "app.fill")!)
        let arcadeVC = createNavController(viewController: UIViewController(), title: "아케이드", image: UIImage(systemName: "cube.box.fill")!)
        let searchVC = createNavController(viewController: UIViewController(), title: "검색", image: UIImage(systemName: "magnifyingglass")!)
        
        // 탭바에 추가
        viewControllers = [todayVC, gameVC, appVC, arcadeVC, searchVC]
        
        // 탭바 배경색 및 탭 아이템 색상 설정
        tabBar.barTintColor = .white
        tabBar.tintColor = .systemBlue
    }
    
    // 네비게이션 컨트롤러를 생성하는 함수
    func createNavController(viewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        viewController.navigationItem.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}

// 예시용 헤더 및 등급 뷰 컨트롤러
class HeaderViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "투데이 화면"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

class RatingViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "게임 화면"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

// Preview 지원
#Preview {
    MainTabBarController()
}
