//
//  Coordinator.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/5/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

class Coordinator {
    
    fileprivate(set) final var navigationController: UINavigationController
    fileprivate final var childCoordinators: [Coordinator]
    
    required init(withNavigationController nc: UINavigationController) {
        navigationController = nc
        childCoordinators = []
    }
    
    func start() {
        // overridden
    }
}

extension Coordinator {
    
    final func add(childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    final func remove(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
