//
//  CreateCardViewModel.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation
import RxSwift
import RxCocoa

class CreateCardViewModel: ViewModelType {
    
    private let usecase: ICardUseCase
    private let navigator: CreateCardNavigator
    
    init(usecase: ICardUseCase, navigator: CreateCardNavigator) {
        self.usecase = usecase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let data = Driver.combineLatest(input.name,
                                        input.address,
                                        input.position,
                                        input.about,
                                        input.gender,
                                        input.dob)
        let activityIndicator = ActivityIndicator()
        let canSave = Driver.combineLatest(data, activityIndicator.asDriver()) {
            return !$0.0.isEmpty &&
                !$0.1.isEmpty &&
                !$0.2.isEmpty &&
                !$0.3.isEmpty &&
                !$0.4.isEmpty &&
                !$0.5.isEmpty &&
                !$1
        }
        
        let save = input.saveAction.withLatestFrom(data)
            .map { name, address, position, about, gender, dob -> Card in
                return .init(name: name,
                             mobile: "Default",
                             company: "Default",
                             position: position,
                             address: address,
                             id: UUID().uuidString,
                             createdAt: Date(),
                             about: about,
                             gender: gender,
                             dob: dob)
            }
            .flatMapLatest { [unowned self] in
                return self.usecase.addNewCard(card: $0)
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
            }
        
        let dismiss = Driver.of(save, input.cancelAction)
            .merge()
            .do(onNext: {
                self.navigator.dismiss()
            })
        
        return .init(dismiss: dismiss,
                     saveEnable: canSave)
    }
}

extension CreateCardViewModel {
    struct Input {
        let name: Driver<String>
        let position: Driver<String>
        let address: Driver<String>
        let gender: Driver<String>
        let dob: Driver<String>
        let about: Driver<String>
        
        let saveAction: Driver<Void>
        let cancelAction: Driver<Void>
    }
    
    struct Output {
        let dismiss: Driver<Void>
        let saveEnable: Driver<Bool>
    }
}
