//
//  NetworkCardUseCase.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/9/21.
//

import Foundation
import RxSwift

class NetworkCardUseCase: ICardUseCase {
    
    private let disposeBag = DisposeBag()
    private let provider = DataLocalUseCaseProvider()
    
    func cards() -> Observable<[Card]> {
        let cache = provider.maketCardUseCase()
        let cardsLocal = cache.cards().asObservable()
        var currentCards = [Card]()
        let remote = APIService.shared.getCards()
        let observer = BehaviorSubject<[Card]>(value: [])
        
        cardsLocal.flatMap { cards -> Observable<[Card]> in
            currentCards.removeAll()
            currentCards.append(contentsOf: cards)
//            observer.onNext(cards)
            return remote
        }.subscribe(onNext: { remoteCards in
            currentCards.append(contentsOf: remoteCards)
            observer.onNext(currentCards)
        }).disposed(by: disposeBag)
        
        return observer.asObservable()
    }
    
    func addNewCard(card: Card) -> Observable<Void> {
        return Observable<Void>.empty()
    }
}
