//
//  UseCaseProvider.swift
//  NetworkLayer
//
//  Created by phuong.doan on 7/7/21.
//

import Foundation
import DomainLayer

public final class UseCaseProvider: IUseCaseProvider {
    
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeCardUseCase() -> ICardUseCase {
        return CardUseCase(networkProvider.makeCardNetwork(), Cache<Card>.init())
    }
}
