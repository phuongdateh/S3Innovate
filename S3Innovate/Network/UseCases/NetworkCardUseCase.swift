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
        let cardsLocal = cache.cards()
        let data = APIService.shared.getCards().do(onNext: { cards in
            cards.forEach({ $0.asLocal()})
        })
//        return cardsLocal.concat(data)
        return APIService.shared.getCards()
    }
}
