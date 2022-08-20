//
//  TabBarController.swift
//  SushiWrote
//
//  Created by Alexander Zub on 04.08.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    
        viewControllers = [
            generateController(rootVC: MenuController(), title: "Меню", image: UIImage(systemName: "menucard.fill")!),
            generateController(rootVC: CartController(), title: "Корзина", image: UIImage(systemName: "cart.fill")!),
            generateController(rootVC: ProfileController(), title: "Профиль", image: UIImage(systemName: "person.crop.circle.fill")!)
        ]
        tabBar.tintColor = ColorsLibrary.darkGreen
        tabBar.backgroundColor = ColorsLibrary.lightGreen
        
    }
    
    func generateController(rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.image = image
        navVC.tabBarItem.title = title
        
        return navVC
    }
}
