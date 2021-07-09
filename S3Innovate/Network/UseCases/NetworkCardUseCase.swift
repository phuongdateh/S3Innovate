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
        return APIService.shared.getCards()
    }
}
