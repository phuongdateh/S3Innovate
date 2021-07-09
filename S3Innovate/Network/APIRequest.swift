//
//  APIRequest.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation

enum RequestType: String {
    case GET, POST
}

protocol APIRequest {
    var metthod: RequestType { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var headers: [String: String] { get }
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
        components.queryItems = parameters.map({
            URLQueryItem(name: "\($0.key)", value: "\($0.value)")
        })
        
        guard let url = components.url else {
            fatalError("Could not get url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = metthod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}


