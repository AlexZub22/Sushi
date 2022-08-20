//
//  SignInView.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//


// cmnd + B Запускает билд без вызова симулятора

import UIKit

class SignInView: UIView {

    let roundView = UIView()
    let rectView = UIView()
    let imageView = UIImageView(image: UIImage(named: "logoSushi"))
    let signInLabel = UILabel(text: "Sign In", font: FontsLibrary.smallTitle)
    let emailTextField = UITextField(placeholder: "Email")
    let passwordTextField = UITextField(placeholder: "Password")
    let signInButton = UIButton(title: "Sign In", bgColor: ColorsLibrary.redButton, textColor: .white, font: FontsLibrary.fieldButton)
    let showSignUpButton = UIButton(title: "Go to sign Up", bgColor: .clear, textColor: ColorsLibrary.darkGreen, font: FontsLibrary.smallButton)
    
    
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
    
    //Отвечает за внешний вид элементов интерфейса
    func setViews() {
        backgroundColor = ColorsLibrary.lightGreen
        rectView.backgroundColor = .white // чтобы вьюха не была прозрачной
        rectView.layer.cornerRadius = 16 // скругляем углы
        roundView.layer.cornerRadius = 60 // делаем круг
        roundView.backgroundColor = .white // также чтобы круг не был прозрачным
       
        //imageView.layer.cornerRadius = 50 / Помогает скруглить углы у квадратной картинки
        //imageView.clipsToBounds = true / Позволяет не выходить за пределы фрейма и не заполнять весь экран
        imageView.contentMode = .scaleAspectFit // Чтобы картинка не растягивалась, в данном случае ровная круглая тарелка
        signInLabel.textAlignment = .center // Текст выравнивается по центру
        signInLabel.textColor = ColorsLibrary.darkGreen
    }
    
    //Отвечает за взаимное расположение элементов на экране
    func setConstraints() {
        //Порядок добавление views в массив очень важен поскольку он влияет на расположение на экране
        let stack = UIStackView(views: [signInLabel,
                                        emailTextField,
                                        passwordTextField,
                                        signInButton,
                                        showSignUpButton],
                                axis: .vertical, spacing: 18)
        
        //1. Выстроить иерархию Views, т.е. добавить сабвью
        Helper.addSub(views: [rectView, roundView], to: self)
        Helper.addSub(views: [imageView], to: roundView) //Добавляем картинку на кружок
        Helper.addSub(views: [stack], to: rectView) //Добавляем созданный выше стек на квадрат view
        //2. Отключить авторесайзинг (автоматическое изменение размера)
        Helper.tamicOff(views: [rectView, roundView, imageView, stack])
        //3. Настроить констрейнты
        NSLayoutConstraint.activate([
        stack.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 12),
        stack.leadingAnchor.constraint(equalTo: rectView.leadingAnchor, constant: 24),
        stack.centerXAnchor.constraint(equalTo: centerXAnchor),
        stack.bottomAnchor.constraint(equalTo: rectView.bottomAnchor, constant: -24) // -24 Потому что левая верхняя точка является "0"
        
        ])
        NSLayoutConstraint.activate([
        imageView.heightAnchor.constraint(equalToConstant: 100),
        imageView.widthAnchor.constraint(equalToConstant: 100),
        imageView.centerYAnchor.constraint(equalTo: roundView.centerYAnchor),
        imageView.centerXAnchor.constraint(equalTo: roundView.centerXAnchor)
                                    ])
        NSLayoutConstraint.activate([
        rectView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
        rectView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
        rectView.heightAnchor.constraint(equalToConstant: 360),
        rectView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        NSLayoutConstraint.activate([
        roundView.heightAnchor.constraint(equalToConstant: 120),
        roundView.widthAnchor.constraint(equalToConstant: 120),
        roundView.centerXAnchor.constraint(equalTo: rectView.centerXAnchor),
        roundView.centerYAnchor.constraint(equalTo: rectView.topAnchor)
                                    ])
        let views = [emailTextField, passwordTextField, signInButton, showSignUpButton] // Вносим views требующие изменения в массив
        for view in views {
            NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: 40)]) // изменяем у всех view в массиве высоту на 48
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
