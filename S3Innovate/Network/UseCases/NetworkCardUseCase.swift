//
//  NetworkCardUseCase.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/9/21.
//

import Foundation
import RxSwift

class NetworkCardUseCase: ICardUseCase {
    
    func cards() -> Observable<[Card]> {
        let provider = DataLocalUseCaseProvider()
        let cache = provider.maketCardUseCase()
        let cardsLocal = cache.cards().asObservable()
        let stored = APIService.shared.getCards()
            .do(onNext: { cards in
            cards.forEach({ $0.asLocal() })
        })
        return stored.concat(cardsLocal)
            .map { cards in
                return cards.sorted(by: { $0.createdAt > $1.createdAt})
            }
    }
    
    func addNewCard(card: Card) -> Observable<Void> {
        return Observable<Void>.just(())
    }
}
