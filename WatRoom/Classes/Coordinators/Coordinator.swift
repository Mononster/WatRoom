//
//  Coordinator.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/5/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    init(withNavigationController nc: UINavigationController)
    
    func start()
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

extension Coordinator {
    
    func add(childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    func remove(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}
