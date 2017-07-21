//
//  UWScheduleAlertUpgradeView.swift
//  RateMyProfSpider
//
//  Created by Monster on 2017-07-17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

class AlertUpgradeCell: UITableViewCell {
    
    @IBOutlet weak var shortDescription: UILabel! {
        didSet {
            self.shortDescription.numberOfLines = 0
        }
    }
    
    var content: String? {
        didSet {
            shortDescription.text = content
            shortDescription.sizeToFit()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

