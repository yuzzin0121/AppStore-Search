//
//  TabBarController.swift
//  AppStore-Search
//
//  Created by 조유진 on 4/7/24.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addViewControllers()
    }
    
    private func configureView() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .lightGray
    }
    
    private func addViewControllers() {
        let todayVC = TodayViewController()
        let todayNav = UINavigationController(rootViewController: todayVC)
        todayNav.tabBarItem = UITabBarItem(title: nil, image: TabItem.today.image, selectedImage: TabItem.today.selectedImage)
  
        let gameVC = GameViewController()
        let gameNav = UINavigationController(rootViewController: gameVC)
        gameNav.tabBarItem = UITabBarItem(title: nil, image: TabItem.game.image, selectedImage: TabItem.game.image)
        
        let appVC = AppViewController()
        let appNav = UINavigationController(rootViewController: appVC)
        appNav.tabBarItem = UITabBarItem(title: nil, image: TabItem.app.image, selectedImage: TabItem.app.selectedImage)
        
        let arcadeVC = ArcadeViewController()
        let arcadeNav = UINavigationController(rootViewController: arcadeVC)
        arcadeNav.tabBarItem = UITabBarItem(title: nil, image: TabItem.arcade.image, selectedImage: TabItem.arcade.selectedImage)
        
        let searchVC = SearchViewController()
        let searchNav = UINavigationController(rootViewController: searchVC)
        searchNav.tabBarItem = UITabBarItem(title: nil, image: TabItem.search.image, selectedImage: TabItem.search.selectedImage)
        
        viewControllers = [todayNav, gameNav, appNav, arcadeNav, searchNav]
    }

}
