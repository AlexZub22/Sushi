//
//  SingUpView.swift
//  SushiWrote
//
//  Created by Alexander Zub on 09.08.2022.
//

import UIKit

class SignUpView: UIView {
    
    let rectView = UIView()
    let imageView = UIImageView(image: UIImage(named: "logoSushi"))
    let registrationLabel = UILabel(text: "Registration", font: FontsLibrary.smallTitle)
    let emailTextField = UITextField(placeholder: "Email:")
    let passwordTextField = UITextField(placeholder: "Password:")
    let repeatPasswordTextField = UITextField(placeholder: "Repeat password:")
    let registerButton = UIButton(title: "Go!", bgColor: ColorsLibrary.redButton, textColor: .white, font: FontsLibrary.fieldButton)
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
   
    func setViews() {
        backgroundColor = ColorsLibrary.lightGreen
        rectView.backgroundColor = .white // чтобы вьюха не была прозрачной
        rectView.layer.cornerRadius = 16 // скругляем углы
        imageView.contentMode = .scaleAspectFit // Чтобы картинка не растягивалась, в данном случае ровная круглая тарелка
        registrationLabel.textAlignment = .center // Текст выравнивается по центру
        registrationLabel.textColor = ColorsLibrary.darkGreen
    }
    
    func setConstraints() {
        let stack = UIStackView(views: [registrationLabel, emailTextField, passwordTextField, repeatPasswordTextField, registerButton], axis: .vertical, spacing: 30)
        Helper.addSub(views: [imageView], to: self)
        Helper.addSub(views: [rectView], to: self)
        Helper.addSub(views: [stack], to: rectView) //Добавляем созданный выше стек на квадрат view
        //2. Отключить авторесайзинг (автоматическое изменение размера)
        Helper.tamicOff(views: [rectView, imageView, stack])
        NSLayoutConstraint.activate([
        //stack.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 12),
        stack.leadingAnchor.constraint(equalTo: rectView.leadingAnchor, constant: 24),
        stack.centerXAnchor.constraint(equalTo: centerXAnchor),
        stack.bottomAnchor.constraint(equalTo: rectView.bottomAnchor, constant: -24) // -24 Потому что левая верхняя точка является "0"
        
        ])
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 50)
                                    ])
        NSLayoutConstraint.activate([
        rectView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
        rectView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
        rectView.heightAnchor.constraint(equalToConstant: 360),
        rectView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
      
        let views = [emailTextField, passwordTextField, repeatPasswordTextField, registerButton] // Вносим views требующие изменения в массив
        for view in views {
            NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: 40)]) // изменяем у всех view в массиве высоту на 48
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
