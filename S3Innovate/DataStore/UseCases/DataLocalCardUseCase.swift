//
//  DataLocalCardUseCase.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation
import RealmSwift
import RxSwift

class DataLocalCardUseCase: ICardUseCase {
    
    func cards() -> Observable<[Card]> {
        let realm = try! Realm()
        let cards = realm.objects(CardLocal.self).sorted(byKeyPath: "createdAt", ascending: false)
        return Observable<[Card]>.just(cards.toArray(ofType: CardLocal.self).map({ $0.toCard()})).asObservable()
    }
    
    func addNewCard(card: Card) -> Observable<Void> {
        let cardLocal = CardLocal(card: card)
        let realm = try! Realm()
        realm.safeWrite {
            realm.add(cardLocal, update: .all)
        }
        return Observable<Void>.just(())
    }
}
