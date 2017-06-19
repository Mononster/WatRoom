//
//  DateControl.swift
//  WatRoom
//
//  Created by Monster on 2017-06-13.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol DateControlActionDelegate: class {
    func tappedMenu(page: Int)
}

class DateControl: UIView {
    
    var startLabelx: CGFloat!
    
    var labelCollection = [UILabel]()
    
    weak var delegate: DateControlActionDelegate?
    
    var currentSelectedIndex = 0
    
    init(titles: [String], frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        // create a view of "count" titles
        // equal width, and we need to save space
        // for the bottom scrollBar.
        //frame: CGRect(x: 0, y: self.frame.height - 3, width: self.frame.width / 2, height: 2)
        
        let count = titles.count
        
        let barWidth = (frame.width - 20) / CGFloat(count)
        let barHeight = barWidth
        
        let rect = CGRect(x: 10, y: 10, width: barWidth, height: barHeight)
        
        for i in 0..<count {
            
            // create tempView and set the location for it.
            
            let tempView = UILabel()
            tempView.frame = rect.offsetBy(dx: CGFloat(i) * rect.width, dy: 0)
            tempView.isUserInteractionEnabled = true
            tempView.tag = i
            tempView.layer.cornerRadius = barWidth / 2
            
            // now create border layer on top of temView that
            // could be using to animate later on
            
            let borderLayer = CAShapeLayer()
            borderLayer.frame = tempView.bounds
            borderLayer.backgroundColor = UIColor.clear.cgColor
            
            let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: barWidth, height: barWidth), cornerRadius: barWidth / 2)
            borderLayer.path = path.cgPath
            borderLayer.strokeColor = Palette.themeColor.cgColor
            borderLayer.fillColor = UIColor.clear.cgColor
            tempView.layer.addSublayer(borderLayer)
            
            
            tempView.backgroundColor = UIColor.clear
            tempView.text = titles[i]
            tempView.textColor = Palette.dateControlTextColor
            let font = UIFont.init(name: "Avenir-Medium", size: 15)
            tempView.font = font
            
            tempView.layer.borderColor = UIColor.clear.cgColor
            tempView.layer.borderWidth = 1.5
            tempView.textAlignment = .center
            
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(tappedMenu))
            tempView.addGestureRecognizer(tap)
            
            // push the label to our collection in order to highlight it in the future.
            labelCollection.append(tempView)
            
            self.addSubview(tempView)
            
        }
        
        highlightItem(index: 0)
    }
    
    
    func highlightItem(index: Int) {
        
        // de-highlight all other labels.
        for i in 0..<labelCollection.count {
            
            for layer in labelCollection[i].layer.sublayers! {
                if let shapeLayer = layer as? CAShapeLayer {
                    shapeLayer.strokeColor = UIColor.clear.cgColor
                }
            }
            
        }
        
        for layer in labelCollection[index].layer.sublayers! {
            if let shapeLayer = layer as? CAShapeLayer {
                shapeLayer.strokeColor = Palette.themeColor.cgColor
                shapeLayer.lineWidth = 1.5
                shapeLayer.removeAllAnimations()
                let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
                strokeAnimation.duration = 0.4
                strokeAnimation.fromValue = 0.1
                strokeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                strokeAnimation.toValue = 1.0
                shapeLayer.add(strokeAnimation, forKey: nil)
            }
        }
        
        
    }
    
    func tappedMenu(tap: UITapGestureRecognizer) {
        let view = tap.view as! UILabel
        
        let page = view.tag
        
        highlightItem(index: page)
        
        delegate?.tappedMenu(page: page)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

