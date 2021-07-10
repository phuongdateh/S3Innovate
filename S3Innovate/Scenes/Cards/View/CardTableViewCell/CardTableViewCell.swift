//
//  CardTableViewCell.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/9/21.
//

import Foundation
import UIKit

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentWrapperView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    
    private var card: CardLocal!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentLbl.numberOfLines = 0
        contentWrapperView.layer.cornerRadius = 10
        contentWrapperView.layer.borderWidth = 1
        contentWrapperView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func setupData(card: CardLocal) {
        self.card = card
        self.didSetData()
    }
    
    private func didSetData() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        let fullString = NSMutableAttributedString()
        fullString.append(str: "Name: \(card.name ?? "")")
        fullString.append(str: "\n\nMobile: \(card.mobile ?? "")")
        fullString.append(str: "\nAddress: \(card.address ?? "")")
        fullString.append(str: "\nCompany: \(card.company ?? "")")
        fullString.append(str: "\nPosition: \(card.position ?? "")")
        
        contentLbl.attributedText = fullString
    }
}

extension NSMutableAttributedString {
    func append(str: String,
                size: CGFloat = 14,
                weight: UIFont.Weight = .regular,
                color: UIColor = .black) {
        append(.init(string: str,
                     attributes: [
                        .font: UIFont.systemFont(ofSize: size, weight: weight),
                        .foregroundColor: color
                     ]))
    }
}
