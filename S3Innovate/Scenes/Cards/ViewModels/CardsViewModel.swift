//
//  CardsViewModel.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

class CardsViewModel: ViewModelType {
    private let usecase: ICardUseCase
    private let navigator: CardsNavigator
    private let disposeBag = DisposeBag()
    
    
    // MARK: - Init
    init(usecase: ICardUseCase, navigator: CardsNavigator) {
        self.usecase = usecase
        self.navigator = navigator
    }
    
    // MARK: - Tranfomrs
    func transform(input: Input) -> Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let cards = input.viewWillAppear.flatMapLatest {
            return self.usecase
                .cards()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
                .map { cards -> [CardLocal] in
                    return cards.map({ $0.toLocal() })
                }
        }
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        let selecedCard: Driver<CardLocal> = input.selection
            .withLatestFrom(cards) { (indexPath, cards) -> CardLocal in
                return cards[indexPath.row]
            }.do(onNext: { cardLocal in
                print("xxxxxx")
            })
        
        let createCard: Driver<Void> = input.createCard
            .do(onNext: {
                print("qqqqqqqq")
            })
        return Output(fetching: fetching,
                      cards: cards,
                      createNewCard: createCard,
                      selectedCard: selecedCard,
                      error: errors)
    }
}

extension CardsViewModel {
    struct Input {
        let viewWillAppear: Driver<Void>
        let createCard: Driver<Void>
        let selection: Driver<IndexPath>
    }
    
    struct Output {
        let fetching: Driver<Bool>
        let cards: Driver<[CardLocal]>
        let createNewCard: Driver<Void>
        let selectedCard: Driver<CardLocal>
        let error: Driver<Error>
    }
}
