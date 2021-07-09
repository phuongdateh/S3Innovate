//
//  IUseCaseProvider.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/9/21.
//

import Foundation
import RxSwift

protocol IUseCaseProvider {
    func maketCardUseCase() -> ICardUseCase
}
