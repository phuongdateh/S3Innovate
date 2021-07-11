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
    let createdAt: Date
    let about: String
    let gender: String
    let dob: String
    
    init(name: String,
         mobile: String,
         company: String,
         position: String,
         address: String,
         id: String,
         createdAt: Date,
         about: String,
         gender: String,
         dob: String) {
        self.name = name
        self.mobile = mobile
        self.company = company
        self.position = position
        self.address = address
        self.id = id
        self.createdAt = createdAt
        self.about = about
        self.gender = gender
        self.dob = dob
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try! container.decode(String.self, forKey: .id)
        self.mobile = try! container.decode(String.self, forKey: .mobile)
        self.address = try! container.decode(String.self, forKey: .address)
        self.company = try! container.decode(String.self, forKey: .company)
        self.position = try! container.decode(String.self, forKey: .position)
        self.name = try! container.decode(String.self, forKey: .name)
        self.createdAt = Date()
        self.about = ""
        self.gender = ""
        self.dob = ""
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case mobile
        case company
        case position
        case address
        case id
        case createdAt
        case about
        case gender
        case dob
    }
}

extension Card {
    func asLocal() {
        let realm = try! Realm()
        realm.safeWrite {
            realm.add(CardLocal.init(card: self), update: .all)
        }
    }
    
    func toLocal() -> CardLocal {
        return .init(card: self)
    }
}

extension Card: Hashable, Equatable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.id == rhs.id
    }
}
