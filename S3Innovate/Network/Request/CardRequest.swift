//
//  CardRequest.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation

class CardRequest: APIRequest {
    var headers: [String : String]
    var metthod: RequestType = .GET
    var parameters: [String : Any]
    var path: String = "cards"
    
    init() {
        parameters = [:]
        headers = [:]
    }
}
