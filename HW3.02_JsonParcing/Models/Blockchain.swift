//
//  Blockchain.swift
//  HW3.02_JsonParcing
//
//  Created by Vladimir Khalin on 15.12.2022.
//

struct Blockchain: Decodable {
    let symbol: String
    let last: Double
}

struct currencyAbb: Decodable {
    var USD: Blockchain
    var EUR: Blockchain
    var RUB: Blockchain
    var PLN: Blockchain
    var GBR: Blockchain
}
