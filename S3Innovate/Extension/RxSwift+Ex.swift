//
//  RxSwift+Ex.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation
import RxCocoa
import RxSwift

extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<Element> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
