//
//  NavigationButton.swift
//  WatRoom
//
//  Created by Monster on 2017-06-13.
//  Copyright © 2017 Monster. All rights reserved.
//
import UIKit

class NavigationButton: UIButton {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var arrow: UIImageView!
    
    @IBOutlet weak var arrowHeight: NSLayoutConstraint!
    @IBOutlet weak var arrowWidth: NSLayoutConstraint!
    
    @IBOutlet weak var arrowCenterYCons: NSLayoutConstraint!
    @IBOutlet weak var titleCenterYCons: NSLayoutConstraint!
    
    var titleText: String? {
        didSet {
            title.text = titleText
        }
    }
    
    class func navigationButton(title: String, imageName : String, titleColor : UIColor = UIColor.black) -> NavigationButton {
        
        let nib = UINib(nibName: "NavigationButton", bundle: nil)
        
        let btn = nib.instantiate(withOwner: nil, options: nil)[0] as! NavigationButton
        
        btn.title?.text = title
        btn.title.textColor = titleColor
        btn.arrow.image = UIImage(named: imageName)
        btn.backgroundColor = UIColor.clear
        
        return btn
    }
    
    func updateArrowDirection(){
        
        // rotate the arrow image.
        self.isSelected = !isSelected
        
        UIView.animate(withDuration: 0.3, animations: {
            
            let angle = self.isSelected ? .pi : 0
            
            self.arrow?.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        })
        
    }
    
}
