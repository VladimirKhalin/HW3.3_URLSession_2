//
//  Blockchain.swift
//  HW3.3_URLSession_2
//
//  Created by Vladimir Khalin on 18.12.2022.
//

struct Blockchain: Decodable {
    let symbol: String
    let last: Double
}

struct CurrencyAbb: Decodable {
    var USD: Blockchain
    var EUR: Blockchain
    var RUB: Blockchain
    var PLN: Blockchain
    var GBP: Blockchain
}
