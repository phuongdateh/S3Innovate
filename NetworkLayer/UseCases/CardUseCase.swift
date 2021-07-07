//
//  CardUseCase.swift
//  NetworkLayer
//
//  Created by phuong.doan on 7/7/21.
//

import Foundation
import RxSwift
import DomainLayer

final class CardUseCase: ICardUseCase {
    
    private let network: CardNetwork
    
    init(_ network: CardNetwork) {
        self.network = network
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
