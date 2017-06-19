//
//  ClassroomsListCell.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/18/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation


class ClassroomsListCell: UITableViewCell, StoryboardInstantiable {
    
    static var identifier = "ClassroomsListCell"
    
    @IBOutlet fileprivate weak var roomNumber: UILabel?
    @IBOutlet fileprivate weak var time: UILabel?
    
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
        guard let classroom = classroom else { return }

        roomNumber?.text = classroom.roomNumber
        //        time?.text = ""
    }
}
