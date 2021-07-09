//
//  APIService.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import RxSwift

class APIService: IServices {
    static let shared = APIService()
    
    func getCards() -> Observable<[Card]> {
        let request = CardRequest.init()
        return Observable<[Card]>.create { observer in
            APIClient<Card>().request(apiRequest: request)
                .subscribe(on: MainScheduler.instance)
                .subscribe(onNext: { cards in
                    observer.onNext(cards)
                    return
                }, onError: { error in
                    observer.onError(error)
                    return
                })
        }
    }
}
