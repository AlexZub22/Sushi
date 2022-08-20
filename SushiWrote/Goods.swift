//
//  Goods.swift
//  SushiWrote
//
//  Created by Alexander Zub on 03.08.2022.

//cmnd + a & ctrl + i - выравнивание текста 


//когда создается модель UIKit не импортируется! Поскольку модель на вью не ссылается


import Foundation

struct Goods {
    
    let id: String
    let title: String
    let price: Int
    let description: String
    let imageTitle: String //Обращение к картинке по имени
    
    
    
}

class LocalData {
    
    static let classical = [Goods(id: UUID().uuidString, title: "Калифорния", price: 350, description: "Знаменитый ролл Калифорния в икре тобико", imageTitle: "kalifornia"), Goods(id: UUID().uuidString, title: "Филадельфия", price: 420, description: "Знаменитый ролл Филадельфия с лосесем и сыром Филадельфия", imageTitle: "filadelphia")]
    static let maki = [Goods(id: UUID().uuidString, title: "Маки с огурцом", price: 280, description: "Бюджетный ролл с огурцом", imageTitle: "makiOgurec"), Goods(id: UUID().uuidString, title: "Маки с угрем", price: 300, description: "Классический маки с угрем", imageTitle: "unagiMaki"), Goods(id: UUID().uuidString, title: "Маки с лосесем", price: 310, description: "Классический маки с лосесем", imageTitle: "sykeMaki"), Goods(id: UUID().uuidString, title: "Маки с тунцом", price: 300, description: "Классический маки с тунцом", imageTitle: "toriMaki")]
    static let burned = [Goods]()
    static let sets = [Goods(id: UUID().uuidString, title: "Фудзияма", price: 2400, description: "Большой сет для компании из 2 человек", imageTitle: "FudziyamaSet"), Goods(id: UUID().uuidString, title: "5 роллов", price: 1700, description: "Самые популярные 5 роллов по низкой цене", imageTitle: "5rolls")]
}
