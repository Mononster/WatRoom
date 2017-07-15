//
//  DataLoadingView.swift
//  WatRoom
//
//  Created by Monster on 2017-07-15.
//  Copyright © 2017 Monster. All rights reserved.
//
import UIKit

class DataLoadingView: UIView{
    
    @IBOutlet weak var animateImageView: UIImageView!
    
    class func dataLoadingView() -> DataLoadingView {
        
        let nib = UINib(nibName: "DataLoadingView", bundle: nil)
        
        return nib.instantiate(withOwner: nil, options: nil)[0] as! DataLoadingView
    }
    
    override func awakeFromNib() {
        
        self.backgroundColor = UIColor.clear
        animateImageView.backgroundColor = UIColor.clear
        animateImageView.image = UIImage.gif(name: "goose")
    }
    
    func startAnimation(){
        self.isHidden = false
        animateImageView.startAnimating()
    }
    
    func stopAnimation(){
        animateImageView.stopAnimating()
        self.isHidden = true
    }
    
}

