//
//  SushiCell.swift
//  SushiWrote
//
//  Created by Alexander Zub on 03.08.2022.
//

import UIKit

class SushiCell: UICollectionViewCell {
    static let reuseId = "SushiCell"
    let imageView = UIImageView(image: UIImage(named: "sushi"))
    let bottomView = UIView()
    let titleLabel = UILabel(text: "Название товара", font: FontsLibrary.cellText)
    let priceLabel = UILabel(text: "3300 р.", font: FontsLibrary.cellText)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstrains()
    }
    
    func setViews() {
        imageView.layer.cornerRadius = 9
        imageView.clipsToBounds = true // Обрезает картинку по краям чтобы было видно скругление
        priceLabel.textAlignment = .right // Выравнивание текста по правому краю
        priceLabel.textColor = ColorsLibrary.lightGreen
        titleLabel.textColor = ColorsLibrary.lightGreen
        bottomView.backgroundColor = ColorsLibrary.alphaBlack
        bottomView.layer.cornerRadius = 9
        
        
    }
    
    func setConstrains() {
        let subViews = [imageView, bottomView, titleLabel, priceLabel]
        Helper.addSub(views: subViews, to: self)
        Helper.tamicOff(views: subViews)
        NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     imageView.topAnchor.constraint(equalTo: topAnchor),
                                     imageView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
                                    ])
        NSLayoutConstraint.activate([bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     bottomView.heightAnchor.constraint(equalToConstant: 32),
                                     bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     bottomView.trailingAnchor.constraint(equalTo: trailingAnchor)
                                    ])
        NSLayoutConstraint.activate([priceLabel.widthAnchor.constraint(equalToConstant: 60),
                                     priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
                                     priceLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor)
                                    ])
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                                     titleLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
                                     titleLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: 12)
                                    ])
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
