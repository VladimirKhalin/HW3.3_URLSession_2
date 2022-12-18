//
//  DataSorce.swift
//  HW3.3_URLSession_2
//
//  Created by Vladimir Khalin on 18.12.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct UrlLink {
    let urlApi: String = "https://www.blockchain.com/ru/ticker"
}

