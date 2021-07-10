//
//  CardsNavigator.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import UIKit

protocol ICardsNavigator {
    func goCardDetail(card: CardLocal)
    func goCreateCard()
}

class CardsNavigator: ICardsNavigator {
    private let storyboard: UIStoryboard
    private let navigationController: UINavigationController
    private var services: IUseCaseProvider
    
    init(_ storyboard: UIStoryboard,
         _ navigationController: UINavigationController) {
        self.services = NetworkUseCaseProvider() // Network
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
    func goCardDetail(card: CardLocal) {
        let navigator = CardDetailNavigator(navigationController, services, card)
        navigator.start()
    }
    
    func goCreateCard() {
        services = DataLocalUseCaseProvider() // Data Local
        let navigator = CreateCardNavigator(navigationController: navigationController, usecase: services.maketCardUseCase())
        navigator.start()
    }
}
