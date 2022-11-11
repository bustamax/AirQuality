//
//  TapBarController.swift
//  Air Quality
//
//  Created by Максим Юрисов on 09.11.2022.
//

import UIKit

enum TapBarItem: Int{
    case list
    case map
    
    var title: String{
        switch self {
        case .list:
            return "Список"
        case .map:
            return "Карта"
        }
    }
    
    var iconname: String{
        switch self {
        case .list:
            return "list"
        case .map:
            return "map"
        }
    }
}
final class TabBarController: UITabBarController{
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.setupTabBar()
        }


    
}

extension TabBarController{
    func setupTabBar() {
        
        tabBar.backgroundColor = Colors.backgroundtap
        let listController = ViewController()
        let mapController = MapViewController()
        
        let listNavController = UINavigationController(rootViewController:listController)
        let mapNavController = UINavigationController(rootViewController:mapController)
        
        listNavController.tabBarItem = UITabBarItem(title: TapBarItem.list.title, image: UIImage(named: TapBarItem.list.iconname), tag: TapBarItem.list.rawValue)
        mapNavController.tabBarItem = UITabBarItem(title: TapBarItem.map.title, image: UIImage(named: TapBarItem.map.iconname), tag: TapBarItem.map.rawValue)
        
        setViewControllers([listNavController, mapNavController], animated: false)
    }
    
}
