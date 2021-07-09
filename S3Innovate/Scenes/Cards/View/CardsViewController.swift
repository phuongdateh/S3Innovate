//
//  CardsViewController.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import UIKit

class CardsViewController: ViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    // MARK: - Properties
    var viewModel: CardsViewModel!
        
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.test()
        configUI()
    }
    
    private func configUI() {
        addButton.layer.cornerRadius = addButton.frame.width / 2
        addButton.rx.tap.subscribe(onNext: { [unowned self] in
            self.addButton_Tap()
        }).disposed(by: disposeBag)
    }
    
    private func addButton_Tap() {
        
    }
}
