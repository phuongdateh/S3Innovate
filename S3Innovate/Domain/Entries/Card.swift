//
//  Card.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import RealmSwift

struct Card: Codable {
    let name: String
    let mobile: String
    let company: String
    let position: String
    let address: String
    let id: String
}

extension Card {
    func asLocal() {
        let realm = try! Realm()
        realm.safeWrite {
            realm.add(CardLocal.init(card: self))
        }
    }
    
    func toLocal() -> CardLocal {
        return .init(card: self)
    }
}
