//
//  NetworkManager.swift
//  HW3.3_URLSession_2
//
//  Created by Vladimir Khalin on 18.12.2022.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchCriptoRate(from url: String?, completiion: @escaping(Result<[Blockchain], NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        DispatchQueue.global().async {
            guard let criptoData = try? Data(contentsOf: url) else {
                completiion(.failure(.noData))
                return
            }
            do {
                //let exchangeRate = try JSONDecoder().decode(CurrencyAbb.self, from: criptoData)
                let exchangeRate = try JSONDecoder().decode([String : Blockchain].self, from: criptoData)
                let values = exchangeRate.map {$0.value}
                //print(values.count)
                
                DispatchQueue.main.async {
                    completiion(.success(values))
                }
            } catch {
                completiion(.failure(.decodingError))
            }
        }
    }
}
