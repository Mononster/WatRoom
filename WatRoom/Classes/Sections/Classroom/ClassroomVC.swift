//
//  ClassroomVC.swift
//  WatRoom
//
//  Created by Ali Ajmine on 7/12/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol ClassroomsVCDelegate: class {
    func didTapBack()
}

class ClassroomVC: UIViewController, StoryboardInstantiable {
    
    static var identifier = "ClassroomVC"
    
    weak var delegate: ClassroomsVCDelegate?
}
