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
        return Observable<[Card]>.create { observer in
            DispatchQueue.main.async {
                let realm = try! Realm()
                let cards = realm.objects(CardLocal.self)
                observer.onNext(cards.toArray(ofType: Card.self))
            }
            return Disposables.create()
        }
    }
}
