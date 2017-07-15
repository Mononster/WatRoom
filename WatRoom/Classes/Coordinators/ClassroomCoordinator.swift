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
    
    override func start() {
        guard let classroomVC = UIStoryboard.main.instantiateViewController(withIdentifier:
            ClassroomVC.identifier) as? ClassroomVC else { return }
        
        classroomVC.delegate = self
        navigationController.pushViewController(classroomVC, animated: false)
    }
}

extension ClassroomCoordinator: ClassroomsVCDelegate {
    
    func didTapBack() {
        delegate?.classroomCoordinatorDidDismiss(self)
    }
}
