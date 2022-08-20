//
//  MenuView.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//

import UIKit

class MenuView: UIView {
    
    // UICollectionView - Элемент интерфейса предназначенная для размещения повторяющихся данных (фотопоток iPhone)
    //Иерархия (от маленького к большому): Item, Group, Section, Layout
    
    //Алгоритм создания UICollectionView
    //1. Объявляем CollectionView
    //2. Создаем Layout (class CompositionLayoutManager)
    //3. Инициализируем CollectionView с созданным Layout
    //4. Размещаем CollectionView на экране
    //5. Создаем View ячейки
    //6. Регестрируем ячейку в СollectionView
    //7. Заполняем ячейку данными
    
    // Инициализация UICollectionView
    
    var collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: CompositionalLayoutManager().createCompositionalLayout())  //Менеджер инициализируется через создание экземпляра, потому что createCompositionalLayout не static метод
    
    //поведение ячеек задается в collectionViewLayout
    
    
   // let quitButton = UIButton(title: "Выйти", bgColor: .clear, textColor: ColorsLibrary.darkGreen, font: FontsLibrary.smallButton)

    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setConstraints()
        collectionView.backgroundColor = .clear
        collectionView.register(SushiCell.self, forCellWithReuseIdentifier: SushiCell.reuseId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)//регистрируем Header
    }
    
    func setConstraints() {
        
        Helper.addSub(views: [collectionView], to: self)
        Helper.tamicOff(views: [collectionView])
        NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 70),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
                                    ])
      //  NSLayoutConstraint.activate([
      //  quitButton.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -8 ),
      //  quitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      //  quitButton.widthAnchor.constraint(equalToConstant: 80),
      //  quitButton.heightAnchor.constraint(equalToConstant: 30)
                        //            ])
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
