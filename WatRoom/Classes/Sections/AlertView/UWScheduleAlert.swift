//
//  UWScheduleAlert.swift
//  RateMyProfSpider
//
//  Created by Monster on 2017-07-17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation

import UIKit

enum UWScheduleAlertStyle {
    case upgrade
    case composeNote
    case notifyEnableNotification
    case notifyEnablePhotos
    case notifyEnableCamera
}

@objc protocol UWScheduleAlertDelegate: class {
    @objc optional func userEnableNotification()
    @objc optional func userClickedUpgrade()
    @objc optional func userEnabledCamera()
    @objc optional func userEnabledPhotoLibraries()
    @objc optional func userClickedSubmit(text: String?)
}

class UWScheduleAlert: UIView {
    
    open var cancelButton: UIButton!
    open var background: UIView!
    
    open var style = UWScheduleAlertStyle.upgrade
    
    open var heightForAlertView: CGFloat!
    open var widthForAlertView: CGFloat!
    
    open var percentageRatioHeight: CGFloat = 0.7
    open var percentageRatioWidth: CGFloat = 0.8
    
    open var verticalContraintsAlertView: NSLayoutConstraint!
    
    weak var delegate: UWScheduleAlertDelegate?
    
    open var composePlaceHolder = "Enter some notes...(Max 100 Chars.)"
    
    public init (style: UWScheduleAlertStyle, placeHolder: String? = nil) {
        super.init(frame: CGRect(x: 0,y: 0, width: 0,height: 0))
        self.style = style
        
        if let placeHolder = placeHolder {
            self.composePlaceHolder = placeHolder
        }
        setupUI()
    }
    
    func setupUI() {
        
        if self.style == UWScheduleAlertStyle.notifyEnableNotification ||
            self.style == UWScheduleAlertStyle.notifyEnablePhotos ||
            self.style == UWScheduleAlertStyle.notifyEnableCamera {
            self.percentageRatioHeight = 0.4
            self.percentageRatioWidth = 0.7
        }
        
        if self.style == UWScheduleAlertStyle.composeNote {
            self.percentageRatioWidth = 0.7
            self.percentageRatioHeight = 0.4
        }
        
        setupBackground()
        setupCancelButton()
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    func setupBackground() {
        self.background = UIView(frame: CGRect(x: 0,y: 0, width: 0, height: 0))
        self.background.backgroundColor = UIColor.black
        self.background.alpha = 0.5
        self.background.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupCancelButton() {
        cancelButton = UIButton()
        cancelButton.setImage(#imageLiteral(resourceName: "cancel_round_button"), for: .normal)
        cancelButton.layer.cornerRadius = 15
        cancelButton.layer.masksToBounds = true
        cancelButton.backgroundColor = kThemeColor
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addTarget(self, action: #selector(cancelBtnClicked), for: .touchUpInside)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }
    
    open func show() {
        // Only show once
        if self.superview != nil {
            return
        }
        
        // Find current stop viewcontroller
        if let topController = getTopViewController() {
            let superView: UIView = topController.view
            superView.addSubview(self.background)
            superView.addSubview(self)
            superView.addSubview(cancelButton)
            self.configureConstraints(topController.view)
            self.animateForOpening()
        }
    }
    
    //Hide onboarding with animation
    open func hide(){
        DispatchQueue.main.async { () -> Void in
            self.animateForEnding()
        }
    }
    
    
    //------------------------------------------------------------------------------------------
    // MARK: PRIVATE FUNCTIONS    --------------------------------------------------------------
    //------------------------------------------------------------------------------------------
    
    
    //MARK: FOR CONFIGURATION    --------------------------------------
    fileprivate func configure() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    
    fileprivate func configureConstraints(_ superView: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        heightForAlertView = UIScreen.main.bounds.height * percentageRatioHeight
        widthForAlertView = UIScreen.main.bounds.width * percentageRatioWidth
        
        //Constraints for alertview
        let horizontalContraintsAlertView = NSLayoutConstraint(item: self, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: superView, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        verticalContraintsAlertView = NSLayoutConstraint(item: self, attribute:.centerYWithinMargins, relatedBy: .equal, toItem: superView, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0)
        let heightConstraintForAlertView = NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView)
        let widthConstraintForAlertView = NSLayoutConstraint.init(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView)
        
        initViewWithStyle(self.style)
        
        let widthContraintsForBackground = NSLayoutConstraint(item: self.background, attribute:.width, relatedBy: .equal, toItem: superView, attribute: .width, multiplier: 1, constant: 0)
        let heightConstraintForBackground = NSLayoutConstraint.init(item: self.background, attribute: .height, relatedBy: .equal, toItem: superView, attribute: .height, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([horizontalContraintsAlertView, verticalContraintsAlertView,heightConstraintForAlertView, widthConstraintForAlertView, widthContraintsForBackground, heightConstraintForBackground])
        
        cancelButton.centerXAnchor.constraint(equalTo: self.rightAnchor, constant: -1).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 1).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    fileprivate func initViewWithStyle(_ style: UWScheduleAlertStyle) {
        
        let notifyContainer: AlertNotifyView
        switch style {
        case .upgrade:
            let container = AlertUpgradeView.upgradeAlertView()
            container.startAnimation()
            container.delegate = self
            self.addSubview(container)
            container.translatesAutoresizingMaskIntoConstraints = false
            container.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            container.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            container.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            return
        case .composeNote:
            let container = ComposeNoteAlertView.composeNoteAlertView(placeHolder: composePlaceHolder)
            container.startAnimation()
            container.delegate = self
            self.addSubview(container)
            container.translatesAutoresizingMaskIntoConstraints = false
            container.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            container.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            container.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            return
        case .notifyEnableNotification:
            let notifyData = "Enable notification for better services.Such as imediate push notification."
            notifyContainer = AlertNotifyView.notifyAlertView(titleImage: #imageLiteral(resourceName: "alert_notification"), description: notifyData)
            self.addSubview(notifyContainer)
        case .notifyEnableCamera:
            let notifyData = "Enable camera for better services."
            notifyContainer = AlertNotifyView.notifyAlertView(titleImage: #imageLiteral(resourceName: "alert_notification"), description: notifyData)
            self.addSubview(notifyContainer)
        case .notifyEnablePhotos:
            let notifyData = "Enable photos for better services."
            notifyContainer = AlertNotifyView.notifyAlertView(titleImage: #imageLiteral(resourceName: "photo_notification"), description: notifyData)
            self.addSubview(notifyContainer)
        }
        
        notifyContainer.delegate = self
        notifyContainer.translatesAutoresizingMaskIntoConstraints = false
        notifyContainer.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        notifyContainer.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        notifyContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        notifyContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    //MARK: FOR ANIMATIONS ---------------------------------
    fileprivate func animateForOpening(){
        self.alpha = 1.0
        self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        self.cancelButton.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.cancelButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    fileprivate func animateForEnding(){
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
            self.background.alpha = 0
            self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            self.cancelButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        }, completion: {
            (finished: Bool) -> Void in
            // On main thread
            DispatchQueue.main.async {
                () -> Void in
                self.background.removeFromSuperview()
                self.cancelButton.removeFromSuperview()
                self.removeFromSuperview()
            }
        })
    }
    
    //MARK: BUTTON ACTIONS ---------------------------------
    
    @objc func onClick(){
    }
    //MARK: OTHERS    --------------------------------------
    fileprivate func getTopViewController() -> UIViewController? {
        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        return topController
    }
}

extension UWScheduleAlert: AlertUpgradeViewDelegate {
    
    func upgradeBtnClicked() {
        self.hide()
    }
}

extension UWScheduleAlert: ComposeNoteAlertViewDelegate {
    
    func composeBtnClicked(text: String) {
        self.hide()
        
        if text == "" {
            delegate?.userClickedSubmit?(text: nil)
        } else {
            delegate?.userClickedSubmit?(text: text)
        }
    }
    
    func userStartEditing(notification: NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue
        let curve = (userInfo[UIKeyboardAnimationCurveUserInfoKey]! as AnyObject).uint32Value
        
        let convertedFrame = self.superview!.convert(keyboardRect!, from: nil)
        let heightOffset = self.superview!.bounds.size.height - convertedFrame.origin.y
        let options = UIViewAnimationOptions(rawValue: UInt(curve!) << 16 | UIViewAnimationOptions.beginFromCurrentState.rawValue)
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey]! as AnyObject).doubleValue
        
        self.verticalContraintsAlertView.constant = -heightOffset + 150
        
        UIView.animate(
            withDuration: duration!,
            delay: 0,
            options: options,
            animations: {
                self.layoutIfNeeded()
        }, completion: { bool in
            
        })
        
    }
}

extension UWScheduleAlert: AlertNotifyViewDelegate {
    func enableBtnClicked() {
        self.hide()
        
        switch self.style {
        case UWScheduleAlertStyle.notifyEnableCamera:
            delegate?.userEnabledCamera!()
        case UWScheduleAlertStyle.notifyEnableNotification:
            delegate?.userEnableNotification!()
        case UWScheduleAlertStyle.notifyEnablePhotos:
            delegate?.userEnabledPhotoLibraries!()
        default:
            break
        }
    }
    func cancelBtnClicked() {
        self.hide()
    }
}

