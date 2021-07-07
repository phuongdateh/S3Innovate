//
//  CardNetwork.swift
//  NetworkLayer
//
//  Created by phuong.doan on 7/7/21.
//

import Foundation
import RxSwift
import DomainLayer

final class CardNetwork {
    private let network: Network<Card>
    
    init(_ network: Network<Card>) {
        self.network = network
    }
    
    public func fetchCards() -> Observable<[Card]> {
        return network.getItems(with: "cards")
    }
    
    public func update(_ card: Card) -> Observable<Card> {
        return network.updateItem(with: "\(card.id)")
    }
    
    public func add(_ card: Card) -> Observable<Card> {
        return network.updateItem(with: "\(card.id)")
    }
    
    public func delete(_ card: Card) -> Observable<Card> {
        return network.updateItem(with: "\(card.id)")
    }
}
