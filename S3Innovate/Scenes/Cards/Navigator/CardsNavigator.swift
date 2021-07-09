//
//  CardsNavigator.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import UIKit

protocol ICardsNavigator {
    func goCardDetail(cardId: String)
}

class CardsNavigator: ICardsNavigator {
    private let storyboard: UIStoryboard
    private let navigationController: UINavigationController
    private let services: IUseCaseProvider
    
    init(_ storyboard: UIStoryboard,
         _ navigationController: UINavigationController,
         _ services: IUseCaseProvider) {
        self.services = services
        self.navigationController = navigationController
        self.storyboard = storyboard
    }
    
    func start() {
        let vc = storyboard.instantiateViewController(ofType: CardsViewController.self)
        vc.viewModel = CardsViewModel(usecase: services.maketCardUseCase(), navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension CardsNavigator {
    func goCardDetail(cardId: String) {
        
    }
}
