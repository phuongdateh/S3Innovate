//
//  CardUseCase.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/9/21.
//

import Foundation
import RxSwift

protocol ICardUseCase {
    func cards() -> Observable<[Card]>
}
