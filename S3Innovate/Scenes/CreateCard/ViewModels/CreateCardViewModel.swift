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
    
    init(usecase: ICardUseCase) {
        self.usecase = usecase
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
        
//        let saveAction = input.saveAction.withLatestFrom(data)
//            .map { name, address, position, about, gender, dob in
//                return Card(name: name, mobile: , company: <#T##String#>, position: <#T##String#>, address: <#T##String#>, id: <#T##String#>)
//            }
        return .init()
    }
}

extension CreateCardViewModel {
    struct Input {
        let name: Driver<String>
        let mobile: Driver<String>
        let company: Driver<String>
        let position: Driver<String>
        let address: Driver<String>
        let gender: Driver<String>
        let dob: Driver<String>
        let about: Driver<String>
        
        let saveAction: Driver<Void>
        let cancelAction: Driver<Void>
    }
    
    struct Output {
//        let dismiss: Driver<Void>
//        let saveEnable: Driver<Void>
    }
}
