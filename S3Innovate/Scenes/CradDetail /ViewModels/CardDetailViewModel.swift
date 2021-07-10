//
//  CardDetailViewModel.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation
import RxCocoa
import RxSwift

class CardDetailViewModel: ViewModelType {
    
    private let service: ICardUseCase
    private let navigator: CardDetailNavigator
    private let card: CardLocal
    
    init(service: ICardUseCase,
         navigator: CardDetailNavigator,
         _ card: CardLocal) {
        self.service = service
        self.navigator = navigator
        self.card = card
    }
    
    func transform(input: Input) -> Output {
        let card: Driver<[CardLocal]> = Driver.just([self.card])
        
        return .init(card: card)
    }
}

extension CardDetailViewModel {
    struct Input {
        
    }
    
    struct Output {
        let card: Driver<[CardLocal]>
    }
}
