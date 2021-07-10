//
//  CardsViewController.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class CardsViewController: ViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    // MARK: - Properties
    var viewModel: CardsViewModel!
    
    private var refreshControl: UIRefreshControl!
        
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        bind()
    }
    
    private func bind() {
        if viewModel != nil {
            let viewWillAppear: Driver<Void> = self.rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).mapToVoid().asDriverOnErrorJustComplete()
            let pull: Driver<Void> = tableView.refreshControl!.rx.controlEvent(.valueChanged).asDriver()
            
            let output = viewModel.transform(input: .init(viewWillAppear: Driver.merge(viewWillAppear, pull),
                                                          createCard: addButton.rx.tap.asDriver(),
                                                          selection: tableView.rx.itemSelected.asDriver()))
            output.cards
                .drive(tableView.rx.items(cellIdentifier: CardTableViewCell.reuseID, cellType: CardTableViewCell.self)) { tv, cardLocal, cell in
                    cell.setupData(card: cardLocal)
                }.disposed(by: disposeBag)
            output.fetching
                .drive(tableView.refreshControl!.rx.isRefreshing)
                .disposed(by: disposeBag)
            output.createNewCard
                .drive()
                .disposed(by: disposeBag)
            output.selectedCard
                .drive()
                .disposed(by: disposeBag)
            
        }
    }
    
    private func configUI() {
        addButton.layer.cornerRadius = addButton.frame.width / 2
        
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: CardTableViewCell.reuseID, bundle: nil), forCellReuseIdentifier: CardTableViewCell.reuseID)
    }
}
