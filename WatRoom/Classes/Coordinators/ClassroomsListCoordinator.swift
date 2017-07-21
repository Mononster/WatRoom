//
//  ClassroomsListCoordinator.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import UIKit

final class ClassroomsListCoordinator: Coordinator {
    
    override func start() {
        guard let classroomsListVC = UIStoryboard.main.instantiateViewController(withIdentifier:
            ClassroomsListVC.identifier) as? ClassroomsListVC else { return }
        
        classroomsListVC.delegate = self
        navigationController.pushViewController(classroomsListVC, animated: false)
    }
}

extension ClassroomsListCoordinator: ClassroomsListVCDelegate {
    
    func didTapClassroom(_ classroom: Classroom, inBuilding building: Building, withTime time: String) {
        let classroomCoordinator = ClassroomCoordinator(withNavigationController: navigationController)
        add(childCoordinator: classroomCoordinator)
        classroomCoordinator.delegate = self
        classroomCoordinator.start(withClassroom: classroom, building: building, time: time)
    }
    
    func didTapCrowdLevel() {
        let crowdLevelCoordinator = CrowdLevelCoordinator(withNavigationController: navigationController)
        add(childCoordinator: crowdLevelCoordinator)
        crowdLevelCoordinator.delegate = self
        crowdLevelCoordinator.start()
    }
}

extension ClassroomsListCoordinator: CrowdLevelCoordinatorDelegate {
    
    func crowdLevelCoordinatorDidDismiss(_ coordinator: Coordinator) {
        remove(childCoordinator: coordinator)
    }
}

extension ClassroomsListCoordinator: ClassroomCoordinatorDelegate {
    
    func classroomCoordinatorDidDismiss(_ coordinator: Coordinator) {
        remove(childCoordinator: coordinator)
    }
}
