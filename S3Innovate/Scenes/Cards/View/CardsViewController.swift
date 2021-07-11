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
    private var searchTf: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Search"
        return textfield
    }()
        
    
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
                    cell.selectionStyle = .none
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
        title = "CARDS"
        addButton.layer.cornerRadius = addButton.frame.width / 2
        
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: CardTableViewCell.reuseID, bundle: nil), forCellReuseIdentifier: CardTableViewCell.reuseID)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.1))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.1))
        tableView.backgroundColor = .lightText
        tableView.backgroundView?.backgroundColor = .lightText
        tableView.separatorStyle = .none
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

extension CardsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.addSubview(searchTf)
        headerView.backgroundColor = .white
        searchTf.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchTf.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            searchTf.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            searchTf.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            searchTf.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            searchTf.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            searchTf.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5)
        ])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 72
    }
}
