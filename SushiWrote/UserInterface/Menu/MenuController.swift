//
//  MenuController.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//

import UIKit

class MenuController: UIViewController {
    
    let menuView = MenuView() // Привязываем вью к контроллеру
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = menuView // Бросаем ссылку
        menuView.collectionView.dataSource = self // MenuController dataView для collectionView
        menuView.collectionView.delegate = self
    }
}


extension MenuController: UICollectionViewDataSource, UICollectionViewDelegate {
    //Возвращает количество секций
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    
    //Возвращает количество ячеек в секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return LocalData.classical.count
        case 1: return LocalData.burned.count
        case 2: return LocalData.maki.count
        case 3: return LocalData.sets.count
        default: return 0
        }
    }
    //Создает, заполняет и возвращает ячейку
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SushiCell.reuseId, for: indexPath) as! SushiCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 8
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowRadius = 4
        
        var rolls = [Goods]()
        
        //Заполняем ячейки контентом
        switch indexPath.section {
        case 0:
            rolls = LocalData.classical
        case 1:
            rolls = LocalData.burned
        case 2:
            rolls = LocalData.maki
        default:
            rolls = LocalData.sets
        }
        
        let roll = rolls[indexPath.item]
        
        cell.titleLabel.text = roll.title
        cell.priceLabel.text = "\(roll.price) р"
        cell.imageView.image = UIImage(named: roll.imageTitle)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailController()
        
        switch indexPath.section {
        case 0: vc.goods = LocalData.classical[indexPath.item]
        case 1: vc.goods = LocalData.burned[indexPath.item]
        case 2: vc.goods = LocalData.maki[indexPath.item]
        default: vc.goods = LocalData.sets[indexPath.item]
        }
        
        vc.delegate = (tabBarController?.viewControllers![1] as! UINavigationController).visibleViewController as! CartController  //Есть таб бар на нем контроллеры (3 шт), берем по индексу 1 и кастим до UINavCont (для того чтобы добраться до свойства visibleViewController), но visibleViewController возвращает UIViewController, который не подписан на протокол CartDelegate, а CartController подписан
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as! HeaderView
        var title: String? = ""
        switch indexPath.section {
        case 0: title = LocalData.classical.count > 0 ? "Классические роллы" : nil
        case 1: title = LocalData.burned.count > 0 ? "Запеченные роллы" : nil
        case 2: title = LocalData.maki.count > 0 ? "Маки" : nil
        default: title = LocalData.sets.count > 0 ? "Сеты" : nil
        }
        header.titleLabel.text = title
        
        return header
    }
    
}
