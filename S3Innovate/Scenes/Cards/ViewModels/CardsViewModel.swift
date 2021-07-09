//
//  CardsViewModel.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import RxSwift

class CardsViewModel {
    private let usecase: ICardUseCase
    private let navigator: CardsNavigator
    
    init(usecase: ICardUseCase, navigator: CardsNavigator) {
        self.usecase = usecase
        self.navigator = navigator
    }
    
    private let disposeBag = DisposeBag()
    
    func test() {
        usecase.cards().subscribe(onNext: { cards in
            print("Number of cards: \(cards.count)")
        }).disposed(by: disposeBag)
    }
    
}
