//
//  ViewController.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//

import UIKit

class SignInController: UIViewController {

    let sighInView = SignInView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = sighInView
        addTargets()
     
    }
    
    //Таргеты для кнопок
    func addTargets() {
        //addTarget вешает эвент на кнопку. .touchUpInside нажать и отпустить внутри кнопки
        sighInView.signInButton.addTarget(self, action: #selector(auth), for: .touchUpInside)
        sighInView.showSignUpButton.addTarget(self, action: #selector(showSingUp), for: .touchUpInside)
    }

    @objc func auth() {
        let vc = TabBarController() //Создаем вью контроллер который планируем отобразить (после добавления TabBarController он становится основным а MenuController его дочерним контроллером
        vc.modalPresentationStyle = .fullScreen // Чтобы экран открывался не карточкой а в полный экран
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @objc func showSingUp() {
        let vc = SignUpController()
        self.present(vc, animated: true, completion: nil)
    }
}

