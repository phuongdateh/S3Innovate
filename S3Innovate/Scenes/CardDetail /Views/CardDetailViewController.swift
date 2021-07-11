//
//  CardDetailViewController.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation
import RxSwift
import RxCocoa

class CardDetailViewController: ViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CardDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        bind()
    }
    
    private func bind() {
        if viewModel != nil {
            let output = viewModel.transform(input: .init())
            output.card
                .drive(tableView.rx.items(cellIdentifier: CardTableViewCell.reuseID, cellType: CardTableViewCell.self)) { tv, card, cell in
                    cell.setupData(card: card)
                    cell.selectionStyle = .none
                }.disposed(by: disposeBag)
        }
    }
    
    private func configUI() {
        title = "CARD DETAIL"
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: CardTableViewCell.reuseID, bundle: nil), forCellReuseIdentifier: CardTableViewCell.reuseID)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.1))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.1))
        tableView.backgroundColor = .lightText
        tableView.backgroundView?.backgroundColor = .lightText
        tableView.separatorStyle = .none
    }
}
