//
//  ClassroomsListVC.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import UIKit

protocol ClassroomsListVCDelegate: class {
    func didTapCrowdLevel()
}

class ClassroomsListVC: UIViewController, StoryboardInstantiable {
    
    static let identifier = "ClassroomsListVC"
    
    weak var delegate: ClassroomsListVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCrowdLevelButtons()
    }
    
    private func addCrowdLevelButtons() {
        
        // TODO: this is temporary. will need to be replaced by icons
        let crowdLevelButton = UIBarButtonItem(title: "Crowd", style: .plain, target: self, action: #selector(didTapCrowdLevel))
        navigationItem.rightBarButtonItem = crowdLevelButton
    }
    
    func didTapCrowdLevel(sender: UIBarButtonItem) {
        delegate?.didTapCrowdLevel()
    }
}
