//
//  NetworkProvider.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/6/21.
//

import Foundation
import DomainLayer

final class NetworkProvider {
    private let baseURL: String
    private let headers: [String: String]
    private let parameters: [String: Any]
    
    init() {
        self.baseURL = "https://60dbd06a801dcb00172912fa.mockapi.io/"
        self.headers = [:]
        self.parameters = [:]
    }
    
    public func makeCardNetwork() -> CardNetwork {
        return .init(Network<Card>(baseURL, headers, parameters))
    }
}
