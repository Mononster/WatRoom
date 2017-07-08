//
//  AppCoordinator.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/2/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    override func start() {
        showClassroomsList()
    }
    
    private func showClassroomsList() {
        let classroomsCoordinator = ClassroomsListCoordinator(withNavigationController: navigationController)
        add(childCoordinator: classroomsCoordinator)
        classroomsCoordinator.start()
        Backend.Init()
    }
}
