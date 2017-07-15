//
//  CrowdLevelCell.swift
//  WatRoom
//
//  Created by Monster on 2017-07-15.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

class CrowdLevelCell: UITableViewCell, StoryboardInstantiable {
    
    static var identifier = "CrowdLevelCell"
    
    @IBOutlet fileprivate weak var libraryName: UILabel?
    @IBOutlet fileprivate weak var crowdLevel: UILabel?
    
    var crowdData: CrowdData? {
        didSet {
            reload()
        }
    }
    
    var classroom: Classroom? {
        didSet {
            reload()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reload()
    }
    
    private func reload() {
        guard let data = crowdData else { return }
        
        libraryName?.text = data.location
        crowdLevel?.text = "Crowd Level: \(data.level)%"
    }
    
}

