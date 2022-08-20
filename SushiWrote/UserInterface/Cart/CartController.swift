//
//  CartController.swift
//  SushiWrote
//
//  Created by Alexander Zub on 04.08.2022.
//

import UIKit

//Создаем делегата. Делегат это класс который вызывает метод другого класса
protocol CartDelegate {
    func addToCart(position: Position)
}

class CartController: UIViewController {
    
    let cartView = CartView()
    var positions = [Position]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = cartView
        cartView.tableView.delegate = self
        cartView.tableView.dataSource = self
        updateViews()
        addTargets()
    }
    
    func addTargets() {
        cartView.clearButton.addTarget(self, action: #selector(clearCart), for: .touchUpInside)
    }
    
    @objc func clearCart() {
        positions.removeAll()
        updateViews()
    }
    
    func updateViews() {
        var sum = 0
        for position in positions {
            sum += (position.price * position.count)
        }
        
        cartView.sumLabel.text = "\(sum) р."
        cartView.tableView.reloadData() //Обновление данных в таблице
    }
    
   
}

extension CartController: CartDelegate {
    func addToCart(position: Position) {
        self.positions.append(position)
        updateViews()
    }
}

extension CartController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PositionCell.reuseId) as! PositionCell
        let pos = positions[indexPath.row]
        
        cell.titleLabel.text = pos.title
        cell.countLabel.text = "\(pos.count) шт."
        cell.priceLabel.text = "\(pos.count * pos.price) р."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return positions.count
    }
   
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        self.tableView(tableView, cellForRowAt: indexPath)
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Удалить") {
                   _, indexPath in
                   self.positions.remove(at: indexPath.row)
                   tableView.deleteRows(at: [indexPath], with: .automatic)
               }
        return [deleteAction]
    }

    
}

