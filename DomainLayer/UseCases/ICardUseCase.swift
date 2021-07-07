//
//  ICardUseCase.swift
//  DomainLayer
//
//  Created by phuong.doan on 7/7/21.
//

import Foundation
import RxSwift

public protocol ICardUseCase {
    func cards() -> Observable<[Card]>
    func add(card: Card) -> Observable<Card>
    func update(card: Card) -> Observable<Card>
    func delete(card: Card) -> Observable<Card>
}

