//
//  CardLocal.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/9/21.
//

import Foundation
import RealmSwift

class CardLocal: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String?
    @objc dynamic var mobile: String?
    @objc dynamic var company: String?
    @objc dynamic var position: String?
    @objc dynamic var address: String?
    @objc dynamic var createdAt: Date?
    
    convenience init(card: Card) {
        self.init()
        self.id = card.id
        self.name = card.name
        self.mobile = card.mobile
        self.company = card.company
        self.position = card.position
        self.address = card.address
        self.createdAt = card.createdAt
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension CardLocal {
    func toCard() -> Card {
        return .init(name: name ?? "", mobile: mobile ?? "", company: company ?? "", position: position ?? "", address: address ?? "", id: id, createdAt: createdAt ?? Date())
    }
}

