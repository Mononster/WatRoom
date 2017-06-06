//
//  Extensions.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedWithArgs(_ arguments: CVarArg...) -> String {
        return String(format: localized(), arguments)
    }
}

extension UIStoryboard {
    
    class var main: UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
}
