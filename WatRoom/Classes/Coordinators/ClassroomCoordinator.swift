//
//  ClassroomCoordinator.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol ClassroomCoordinatorDelegate: class {
    func classroomCoordinatorDidDismiss(_ coordinator: Coordinator)
}

final class ClassroomCoordinator: Coordinator {
    
    weak var delegate: ClassroomCoordinatorDelegate?
    
    func start(withClassroom classroom: Classroom, building: Building) {
        guard let classroomVC = UIStoryboard.main.instantiateViewController(withIdentifier:
            ClassroomVC.identifier) as? ClassroomVC else { return }
        
        classroomVC.delegate = self
        classroomVC.data = (classroom, building)
        navigationController.pushViewController(classroomVC, animated: true)
    }
}

extension ClassroomCoordinator: ClassroomVCDelegate {
    
    func didTapBack() {
        delegate?.classroomCoordinatorDidDismiss(self)
    }
}
