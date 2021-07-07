//
//  IUseCaseProvider.swift
//  DomainLayer
//
//  Created by phuong.doan on 7/7/21.
//

import Foundation

public protocol IUseCaseProvider {
    func makeCardUseCase() -> ICardUseCase
}
