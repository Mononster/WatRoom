//
//  ComposeNoteAlertView.swift
//  RateMyProfSpider
//
//  Created by Monster on 2017-07-17.
//  Copyright © 2017 Monster. All rights reserved.
//

import UIKit

protocol ComposeNoteAlertViewDelegate: class {
    func composeBtnClicked(text: String)
    func userStartEditing(notification: NSNotification)
}

class ComposeNoteAlertView: UIView {
    
    var placeHolderString = "Enter some notes...(Max 100 Chars.)"
    
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var composeBtn: UIButton! {
        didSet {
            composeBtn.layer.cornerRadius = 4
        }
    }
    @IBAction func composeBtnClicked(_ sender: Any) {
        self.inputField.endEditing(false)
        delegate?.composeBtnClicked(text: inputField.text)
    }
    
    @IBOutlet weak var inputField: UITextView! {
        
        didSet {
            self.inputField.delegate = self
        }
    }
    
    var placeholderLabel : UILabel!
    
    weak var delegate: ComposeNoteAlertViewDelegate?
    
    class func composeNoteAlertView(placeHolder: String) -> ComposeNoteAlertView {
        
        let nib = UINib(nibName: "ComposeNoteAlertView", bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil)[0] as! ComposeNoteAlertView
        
        if placeHolder != view.placeHolderString {
            view.inputField.text = placeHolder
            view.placeholderLabel.isHidden = true
        }
        return view
    }
    
    override func awakeFromNib() {
        setupUI()
    }
    
    func startAnimation(){
        self.isHidden = false
        addKeyboardNotifications()
        titleImage.startAnimating()
    }
    
    func stopAnimation(){
        titleImage.stopAnimating()
        removeKeyboardNotifications()
        self.isHidden = true
    }
    
    func addKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardControl), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardControl), name: .UIKeyboardWillHide, object: nil)
    }
    func removeKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
    }
}

extension ComposeNoteAlertView {
    
    func setupUI() {
        self.backgroundColor = UIColor.white
        titleImage.backgroundColor = UIColor.clear
        titleImage.image = UIImage.gif(name: "goose")
        
        placeholderLabel = UILabel()
        placeholderLabel.text = placeHolderString
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: 14)
        placeholderLabel.sizeToFit()
        inputField.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (inputField.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
    }
}

extension ComposeNoteAlertView: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.characters.count
        return numberOfChars < 100
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !inputField.text.isEmpty
    }
}

extension ComposeNoteAlertView {
    
    func keyboardControl(notification: NSNotification) {
        delegate?.userStartEditing(notification: notification)
    }
}

