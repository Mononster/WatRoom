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
    
}
