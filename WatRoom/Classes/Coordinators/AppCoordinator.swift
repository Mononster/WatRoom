//
//  AppCoordinator.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/2/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import UIKit


class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator]
    
    required init(withNavigationController nc: UINavigationController) {
        navigationController = nc
        childCoordinators = []
    }
    
    func start() {
        showContent()
    }
    
    private func showContent() {
        // TODO: show room finder
    }
}
