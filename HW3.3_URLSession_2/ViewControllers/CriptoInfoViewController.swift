//
//  CriptoInfoViewController.swift
//  HW3.3_URLSession_2
//
//  Created by Vladimir Khalin on 18.12.2022.
//

import UIKit

final class CriptoInfoViewController: UIViewController {

    @IBOutlet var criptoCollectionView: UICollectionView!
    @IBOutlet var date: UILabel!
    
    private let currency = ["USD", "EUR", "RUB", "PLN", "GBP"]
    private var values: [Blockchain] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        criptoCollectionView.delegate = self
        criptoCollectionView.dataSource = self
        dateToString(of: Date())
        fetchCriptoRate()
    }
    
    @IBAction func newRateButtonPresed() {
        fetchCriptoRate()
    }
    
    private func fetchCriptoRate() {
        NetworkManager.shared.fetchCriptoRate(from: UrlLink().urlApi) { [weak self] result in
            switch result {
            case .success(let exchangeRate):
                self?.values = exchangeRate
                self?.sortCurrencyValues()
                self?.dateToString(of: Date())
                self?.criptoCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func dateToString(of dateTo: Date) {

      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd MMMM yyyy HH:mm"
      let newDate: String = dateFormatter.string(from: dateTo)
      date.text = newDate
     }

    private func sortCurrencyValues() {
       
        values.sort(by: {$0.symbol < $1.symbol})
 
        for abb in 0..<currency.count {
            for (index, value) in values.enumerated() {
                if currency[abb] == value.symbol {
                    values.rearrange(from: index, to: abb)
                }
            }
        }
    }
    
}

extension CriptoInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        values.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "criptoCell", for: indexPath) as! CriptoCollectionViewCell
               
        Cell.currencyLogo.text = "\(values[indexPath.item].symbol)/BTC"
        Cell.currencyRate.text = String(values[indexPath.item].last)
        Cell.flagLogo.image = UIImage(named: values[indexPath.item].symbol) ?? UIImage(named: "NOFLAG")
        
        return Cell
    }
}

extension CriptoInfoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width - 40
        let height = width / 7
        return CGSize(width: width, height: height)
    }
}

extension Array {
    mutating func rearrange(from: Int, to: Int) {
        insert(remove(at: from), at: to)
    }
}
