//
//  CardsNavigator.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import UIKit

class CardsNavigator {
    private let storyboard: UIStoryboard
    private let navigationController: UINavigationController
    private let apiservice: APIService
    
    init(_ storyboard: UIStoryboard,
        _ navigationController: UINavigationController,
        _ apiservice: APIService) {
        self.apiservice = apiservice
        self.navigationController = navigationController
        self.storyboard = storyboard
    }
    
    func start() {
        let vc = storyboard.instantiateViewController(ofType: CardsViewController.self)
        vc.viewModel = CardsViewModel(apiservice: apiservice)
        navigationController.pushViewController(vc, animated: true)
    }
}
