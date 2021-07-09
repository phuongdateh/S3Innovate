//
//  APIClient.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import RxSwift
import RxCocoa

class APIClient<T: Codable> {
    private let baseURL = URL(string: "https://60dbd06a801dcb00172912fa.mockapi.io")
    
    init() {
        
    }
    
    func request(apiRequest: APIRequest) -> Observable<[T]> {
        guard let baseURL = baseURL else {
            fatalError("error")
        }
        let request = apiRequest.request(with: baseURL)
        return URLSession.shared.rx.data(request: request)
            .observe(on: MainScheduler.instance)
            .map { data in
                return try JSONDecoder().decode([T].self, from: data)
            }
    }
}
