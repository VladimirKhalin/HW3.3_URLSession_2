//
//  CriptoInfoViewController.swift
//  HW3.3_URLSession_2
//
//  Created by Vladimir Khalin on 18.12.2022.
//

import UIKit

class CriptoInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCriptoRate()
        
    }

    private func fetchCriptoRate() {
        NetworkManager.shared.fetchCriptoRate(from: UrlLink().urlApi) { result in
            switch result {
            case .success(let exchangeRate):
                print(exchangeRate)
            case .failure(let error):
                print(error)
            }
        }
    }

}
extension CriptoInfoViewController {
    
}
