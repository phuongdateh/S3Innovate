//
//  CreateCardViewController.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation
import RxSwift
import RxCocoa

class CreateCardViewController: ViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var addressTf: UITextField!
    @IBOutlet weak var positionTf: UITextField!
    @IBOutlet weak var aboutTf: UITextField!
    @IBOutlet weak var genderTf: UITextField!
    @IBOutlet weak var dobTf: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Properties
    var viewModel: CreateCardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        binds()
    }
    
    private func binds() {
        
    }
    
    private func configUI() {
        title = "NEW CARD VISIT"
        imageView.layer.cornerRadius = imageView.frame.width / 2
        saveButton.layer.cornerRadius = 5
    }
}
