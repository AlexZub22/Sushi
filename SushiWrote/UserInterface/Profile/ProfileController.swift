//
//  ProfileController.swift
//  SushiWrote
//
//  Created by Alexander Zub on 04.08.2022.
//

import UIKit

class ProfileController: UIViewController {

    let profileView = ProfileView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = profileView
        addTargets()
    }
    
    
    func addTargets() {
        profileView.quitButton.addTarget(self, action: #selector(quit), for: .touchUpInside)
        profileView.changeAdressButton.addTarget(self, action: #selector(changeAdress), for: .touchUpInside)
        profileView.changePhone.addTarget(self, action: #selector(changePhone), for: .touchUpInside)
    }

    @objc func quit() {
        let vc = SignInController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @objc func changeAdress() {
        let alert = UIAlertController(title: "Введите новый адрес", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.text = self.profileView.adressLabel.text
        }
        let okAction = UIAlertAction(title: "Готово!", style: .default) { _ in
            self.profileView.adressLabel.text = alert.textFields![0].text
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func uiTextFieldLength(textField: UITextField, length: Int) -> String {
        let text: String = textField.text!
        var newText: String = ""
        var newArray: [Character] = []
        for el in text {
            newArray.append(el)
        }
        if newArray.count > length {
            newArray.removeLast(newArray.count - length)
        } else {
            return text
        }
        newText = String(newArray)
        return newText
    }
    @objc func changePhone() {
    
        let alert = UIAlertController(title: "Введите новый нормер телефона", message: nil, preferredStyle: .alert)
        let phoneNumber: String = (self.profileView.phoneLabel.text)!
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
            textField.text = phoneNumber
            textField.delegate = self
        }
        let okAction = UIAlertAction(title: "Готово!", style: .default) { _ in
            self.profileView.phoneLabel.text = alert.textFields![0].text
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
}

extension ProfileController: UITextFieldDelegate {
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
textField.text!.count <= 11
}
}
