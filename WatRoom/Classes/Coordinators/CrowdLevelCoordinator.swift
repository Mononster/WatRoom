//
//  CrowdLevelCoordinator.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import UIKit

protocol CrowdLevelCoordinatorDelegate: class {
    func crowdLevelCoordinatorDidDismiss(_ coordinator: Coordinator)
}

final class CrowdLevelCoordinator: Coordinator {
    
    weak var delegate: CrowdLevelCoordinatorDelegate?
    
    override func start() {
        guard let crowdLevelVC = UIStoryboard.main.instantiateViewController(withIdentifier:
            CrowdLevelVC.identifier) as? CrowdLevelVC else { return }
        
        crowdLevelVC.delegate = self
        navigationController.pushViewController(crowdLevelVC, animated: false)
    }
}

extension CrowdLevelCoordinator: CrowdLevelVCDelegate {
    
    func didTapBack() {
        delegate?.crowdLevelCoordinatorDidDismiss(self)
    }
}
