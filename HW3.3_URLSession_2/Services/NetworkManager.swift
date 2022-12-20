//
//  NetworkManager.swift
//  HW3.3_URLSession_2
//
//  Created by Vladimir Khalin on 18.12.2022.
//
import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    var criptos: [Blockchain] = []
    
    func fetchCriptoRate(from url: String, completion: @escaping(Result<[Blockchain], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    self.criptos = Blockchain.getCriptos(from: value)
                    completion(.success(self.criptos))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
    /*
    func fetchCriptoRate(from url: String?, completiion: @escaping(Result<[Blockchain], NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        DispatchQueue.global().async {
            guard let criptoData = try? Data(contentsOf: url) else {
                completiion(.failure(.noData))
                return
            }
            do {

                let exchangeRate = try JSONDecoder().decode([String : Blockchain].self, from: criptoData)
                let values = exchangeRate.map {$0.value}
                
                DispatchQueue.main.async {
                    completiion(.success(values))
                }
            } catch {
                completiion(.failure(.decodingError))
            }
        }
    }
    */
    

