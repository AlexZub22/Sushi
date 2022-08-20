//
//  HeaderView.swift
//  SushiWrote
//
//  Created by Alexander Zub on 03.08.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let reuseId = "HeaderView"
    let titleLabel = UILabel(text: "Название секции", font: FontsLibrary.smallTitle)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        Helper.tamicOff(views: [titleLabel])
        NSLayoutConstraint.activate([titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
                                    ])
    }
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
