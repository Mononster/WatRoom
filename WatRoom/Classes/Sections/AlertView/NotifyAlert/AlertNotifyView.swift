//
//  AlertNotifyView.swift
//  RateMyProfSpider
//
//  Created by Monster on 2017-07-17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol AlertNotifyViewDelegate: class {
    func cancelBtnClicked()
    func enableBtnClicked()
}

class AlertNotifyView: UIView {
    
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var cancelBtn: UIButton! {
        didSet {
            cancelBtn.layer.cornerRadius = 4
        }
    }
    @IBOutlet weak var ackButton: UIButton! {
        didSet {
            ackButton.layer.cornerRadius = 4
        }
    }
    @IBAction func cancelBtnClicked(_ sender: Any) {
        delegate?.cancelBtnClicked()
    }
    @IBAction func ackBtnClicked(_ sender: Any) {
        delegate?.enableBtnClicked()
    }
    
    weak var delegate: AlertNotifyViewDelegate?
    
    class func notifyAlertView(titleImage: UIImage, description: String) -> AlertNotifyView {
        
        let nib = UINib(nibName: "AlertNotifyView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil)[0] as! AlertNotifyView
        
        view.titleImage.image = titleImage
        view.title.text = description
        
        return view
    }
    
    override func awakeFromNib() {
        setupUI()
    }
}

extension AlertNotifyView {
    
    func setupUI() {
        self.backgroundColor = UIColor.white
        titleImage.backgroundColor = UIColor.clear
    }
}

