//
//  CriptoCollectionViewCell.swift
//  HW3.3_URLSession_2
//
//  Created by Vladimir Khalin on 18.12.2022.
//

import UIKit

class CriptoCollectionViewCell: UICollectionViewCell {
    @IBOutlet var stackCell: UIStackView!
    @IBOutlet var flagLogo: UIImageView!
    @IBOutlet var currencyLogo: UILabel!
    @IBOutlet var currencyRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        stackCell.layer.borderWidth = 3
        stackCell.layer.borderColor = UIColor.white.cgColor
        stackCell.layer.backgroundColor = CGColor(gray: 1, alpha: 0.4)
        let height = stackCell.frame.height + 7
        stackCell.layer.cornerRadius = height / 2
        
        stackCell.layer.masksToBounds = false
        stackCell.layer.shadowColor = UIColor.black.cgColor
        stackCell.layer.shadowOpacity = 0.5
        stackCell.layer.shadowOffset = CGSize(width: -1, height: 1)
        stackCell.layer.shadowRadius = 1
        
        flagLogo.layer.cornerRadius = 19
    }
}
