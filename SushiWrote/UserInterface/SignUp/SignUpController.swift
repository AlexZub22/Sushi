//
//  SignUpController.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//

import UIKit

class SignUpController: UIViewController {

    let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = signUpView
        addTargets()
        view.backgroundColor = ColorsLibrary.lightGreen
    }
    
    func addTargets() {
        signUpView.registerButton.addTarget(self, action: #selector(go), for: .touchUpInside)
    }

    
    @objc func go() {
        
        let passAlert = UIAlertController(title: "", message: "Пароли не совпадают. Повторите ввод", preferredStyle: UIAlertController.Style.alert)
        let emailAlert = UIAlertController(title: "", message: "Введите email", preferredStyle: UIAlertController.Style.alert)
        let emailValidAlert = UIAlertController(title: "", message: "Адрес email введен неверно", preferredStyle: UIAlertController.Style.alert)
        passAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Ok")
        }))
        emailAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Ok")
        }))
        emailValidAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Ok")
        }))
        guard signUpView.emailTextField.text?.count != 0 else {
            present(emailAlert, animated: true, completion: nil)
            return
        }
        let email: String = (signUpView.emailTextField.text)!
        
        guard email.contains("@") && email.contains(".") else {
            present(emailValidAlert, animated: true, completion: nil)
            return
        }
        guard signUpView.passwordTextField.text == signUpView.repeatPasswordTextField.text && signUpView.passwordTextField.text!.count > 0 else {
            present(passAlert, animated: true, completion: nil)
            return
        }
        
       
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
   
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return true;
    }
}
