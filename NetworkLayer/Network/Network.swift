//
//  Network.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/6/21.
//

import Foundation
import RxSwift
import Alamofire

final class Network<T: Decodable> {
    private let baseUrl: String
    private let headers: [String: String]
    private let parameters: [String: Any]
    
    
    init(_ baseUrl: String,
         _ headers: [String: String],
         _ parameters: [String: Any]) {
        self.baseUrl = baseUrl
        self.headers = headers
        self.parameters = parameters
    }
    
    func getItems(with endpoint: String) -> Observable<[T]> {
        return Observable<[T]>.create { obsever in
            let request = AF.request("\(self.baseUrl)/\(endpoint)",
                                     method: .get,
                                     parameters: self.parameters,
                                     headers: HTTPHeaders(self.headers))
                    .validate()
                    .responseDecodable(completionHandler: { (response: DataResponse<[T], AFError>) in
                        switch response.result {
                        case .success(let cards):
                            obsever.onNext(cards)
                        case .failure(let error):
                            obsever.onError(error)
                        }
                    })
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func updateItem(with itemId: String) -> Observable<T> {
        return Observable<T>.create({ observer in
            let request = AF.request(self.baseUrl).validate()
            return Disposables.create {
                request.cancel()
            }
        })
    }
    
    func addItem(with itemId: String) -> Observable<T> {
        return Observable<T>.create({ observer in
            let request = AF.request(self.baseUrl).validate()
            return Disposables.create {
                request.cancel()
            }
        })
    }
    
    func deleteItem(with itemId: String) -> Observable<T> {
        return Observable<T>.create({ observer in
            let request = AF.request(self.baseUrl).validate()
            return Disposables.create {
                request.cancel()
            }
        })
    }
}
