//
//  Card.swift
//  DomainLayer
//
//  Created by phuong.doan on 7/7/21.
//

import Foundation

public struct Card: Decodable {
    public let name: String
    public let mobile: String
    public let company: String
    public let position: String
    public let address: String
    public let id: String
}
