//
//  CrowdLevelVC.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/13/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation

protocol CrowdLevelVCDelegate: class {
    func didTapBack()
}

class CrowdLevelVC: UIViewController, StoryboardInstantiable {
    
    static var identifier = "CrowdLevelVC"
    
    weak var delegate: CrowdLevelVCDelegate?
    
    @IBOutlet fileprivate weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        
        guard parent == nil else { return }
        delegate?.didTapBack()
    }
    
    
    
    
}
