//
//  Application.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/8/21.
//

import Foundation
import UIKit

class Application {
    
    static let shared = Application()
    
    init() {
        
    }
    
    func configMain(with window: UIWindow) {
        let storyboard = UIStoryboard(name: "Cards", bundle: nil)
        let navigationController = UINavigationController()
        let navigator = CardsNavigator(storyboard, navigationController)
        
        window.rootViewController = navigationController
        navigator.start()
    }
}
