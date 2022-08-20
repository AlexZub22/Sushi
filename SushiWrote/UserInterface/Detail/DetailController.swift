//
//  DetailController.swift
//  SushiWrote
//
//  Created by Alexander Zub on 04.08.2022.
//

import UIKit

class DetailController: UIViewController {

    var delegate: CartDelegate? //свойство делегат
    let detailView = DetailView()
    var goods = Goods(id: "", title: "", price: 0, description: "", imageTitle: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        configViews()
        addTargets()
        
    }
    
    //Таргеты для кнопок
    func addTargets() {
        detailView.addToCartButton.addTarget(self, action: #selector(showAddToCartAlert), for: .touchUpInside) //(место где будет происходить обработка, экшн с обджиктив си методом, прикосновение)
    }
    
    //Что должно происходить и потом по какому действию должно происходить.
    
    @objc func showAddToCartAlert() {
        
        let alert = UIAlertController(title: "Введите количество", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Количество"
            textField.keyboardType = .numberPad // Тип клавиатуры
        } // Добавляем текстовое поле на алерт. Все поля добавляются в массив текстовых полей в алерте
        let addToCartButton = UIAlertAction(title: "Добавить", style: .default) { _ in
            guard let countText = alert.textFields![0].text else {
                return
            }
            guard let count = Int(countText) else {
                return
            }
            let position = Position(title: self.goods.title, price: self.goods.price, count: count) //создали позицию
            self.delegate?.addToCart(position: position) //отправили позицию в корзину
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        alert.addAction(addToCartButton)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    //Метод настраивает отображение данных на экране detailView
    
    private func configViews() {
        detailView.titleLabel.text = goods.title
        detailView.priceLabel.text = "\(goods.price) р."
        detailView.descrTextView.text = goods.description
        detailView.imageView.image = UIImage(named: goods.imageTitle)
    }
}
