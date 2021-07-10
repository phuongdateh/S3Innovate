//
//  CardDetailNavigator.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation
import UIKit

protocol ICardDetailNavigator {
    func back()
}

class CardDetailNavigator: ICardDetailNavigator {
    
    private let navigationController: UINavigationController
    private let service: IUseCaseProvider
    private let card: CardLocal
    
    init(_ navigationController: UINavigationController,
         _ service: IUseCaseProvider,
         _ card: CardLocal) {
        self.navigationController = navigationController
        self.service = service
        self.card = card
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "CardDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(ofType: CardDetailViewController.self)
        vc.viewModel = CardDetailViewModel(service: service.maketCardUseCase(), navigator: self, card)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
