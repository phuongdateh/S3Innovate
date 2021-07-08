//
//  CardUseCase.swift
//  NetworkLayer
//
//  Created by phuong.doan on 7/7/21.
//

import Foundation
import RxSwift
import DomainLayer

final class CardUseCase<Cache>: ICardUseCase where Cache: AbstractCache, Cache.T == Card {
    
    private let network: CardNetwork
    private let cache: Cache
    
    init(_ network: CardNetwork,_ cache: Cache) {
        self.network = network
        self.cache = cache
    }
    
    func cards() -> Observable<[Card]> {
        return network.fetchCards()
    }
    
    func add(card: Card) -> Observable<Card> {
        return network.add(card)
    }
    
    func update(card: Card) -> Observable<Card> {
        return network.update(card)
    }
    
    func delete(card: Card) -> Observable<Card> {
        return network.delete(card)
    }
}
