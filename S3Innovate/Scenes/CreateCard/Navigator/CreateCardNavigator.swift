//
//  CreateCardNavigator.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation
import UIKit

protocol ICreateCardNavigator {
    func dismiss()
}

class CreateCardNavigator: ICreateCardNavigator {
    
    private let naivigationController: UINavigationController
    private let usecase: ICardUseCase
    
    init(navigationController: UINavigationController, usecase: ICardUseCase) {
        self.usecase = usecase
        self.naivigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "CreateCard", bundle: nil)
        let vc = storyboard.instantiateViewController(ofType: CreateCardViewController.self)
        let rootVC = UINavigationController(rootViewController: vc)
        naivigationController.present(rootVC, animated: true, completion: nil)
    }

    func dismiss() {
        naivigationController.dismiss(animated: true, completion: nil)
    }
}
