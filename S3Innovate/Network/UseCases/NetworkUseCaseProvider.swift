//
//  NetworkUseCaseProvider.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/9/21.
//

import Foundation

class NetworkUseCaseProvider: IUseCaseProvider {
    
    func maketCardUseCase() -> ICardUseCase {
        return NetworkCardUseCase()
    }
}
