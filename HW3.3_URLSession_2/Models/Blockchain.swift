//
//  Blockchain.swift
//  HW3.3_URLSession_2
//
//  Created by Vladimir Khalin on 18.12.2022.
//

struct Blockchain: Decodable {
    let symbol: String
    let last: Double
    
    init(criptoData: [String: Any]) {
        symbol = criptoData["symbol"] as? String ?? ""
        last = criptoData["last"] as? Double ?? 0
    }
    
    static func getCriptos(from value: Any) -> [Blockchain] {
        guard let criptosData = value as? [String : [String: Any]] else { return [] }
        let criptosDataClear = criptosData.map {$0.value}
        
        var criptos: [Blockchain] = []
        
        for criptoData in criptosDataClear {
            let cripto = Blockchain(criptoData: criptoData)
            criptos.append(cripto)
        }
        return criptos
        
        //return criptosData.compactMap { Blockchain(criptoData: $0)
    }
}


