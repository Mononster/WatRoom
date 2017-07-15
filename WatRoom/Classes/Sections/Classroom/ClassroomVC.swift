//
//  ClassroomVC.swift
//  WatRoom
//
//  Created by Ali Ajmine on 7/12/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol ClassroomVCDelegate: class {
    func didTapBack()
}

class ClassroomVC: UIViewController, StoryboardInstantiable {
    
    static var identifier = "ClassroomVC"
    
    @IBOutlet fileprivate weak var imageView: UIImageView?
    @IBOutlet fileprivate weak var roomtitle: UILabel?
    @IBOutlet fileprivate weak var date: UILabel?
    
    @IBOutlet fileprivate weak var shareButton: UIButton?
    @IBOutlet fileprivate weak var reportErrorButton: UIButton?
    
    weak var delegate: ClassroomVCDelegate?
    
    var data: (classroom: Classroom, building: Building)? {
        didSet {
            reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        
        guard parent == nil else { return }
        delegate?.didTapBack()
    }
    
    private func reloadData() {
        guard let classroom = data?.classroom, let building = data?.building else { return }
        
        roomtitle?.text = building.abbreviation + " - " + classroom.roomNumber
    }
}
