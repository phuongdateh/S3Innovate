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
        
        
    }
    
    func setupData(card: CardLocal) {
        self.card = card
        self.didSetData()
    }
    
    private func didSetData() {
        
    }
}
