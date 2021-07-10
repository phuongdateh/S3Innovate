//
//  DataLocalUseCaseProvider.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation

class DataLocalUseCaseProvider: IUseCaseProvider {
    func maketCardUseCase() -> ICardUseCase {
        return DataLocalCardUseCase.init()
    }
}
