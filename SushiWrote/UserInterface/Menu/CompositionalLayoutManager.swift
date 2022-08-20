//
//  CompositionalLayoutManager.swift
//  SushiWrote
//
//  Created by Alexander Zub on 02.08.2022.
//

import UIKit

class CompositionalLayoutManager {
    
    enum Section: Int, CaseIterable {
        case classical, burned, maki, sets
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        //2. Создаем Layout (class CompositionLayoutManager)
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            guard let _ = Section(rawValue: sectionIndex) else {
                fatalError("Не удалось создать секцию")
            }
            
            return self.createSection()
            
        }
        
        return layout
    }
    
    func createSection() -> NSCollectionLayoutSection {
        //Item
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.47), heightDimension: .fractionalHeight(0.95)) //фракции (процент от размера большей части
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5)) //.fractionalWidth в обоих случаях актуально для квадратных ячеек
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let spacing: CGFloat = 12
        group.interItemSpacing = .fixed(spacing) // фиксированное расстояние между элементами
        
        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8) //Отступы контента от вьюхи
        //Возвращаем header для секции
        section.boundarySupplementaryItems = [createHeader()]
        return section
        
    }
    //Создаем место в лэйауте под Header
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(40)) //estimated абсолютная велечина
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: size, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top) // alignment - выравнивание
        header.zIndex = 2 // элемент строго по верху
        return header
    }
    
}
