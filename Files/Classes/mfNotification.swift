//
//  mfNotification.swift
//  mfNotificationProj
//
//  Created by Mohammad Firouzi on 6/14/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

public class mfNotification {
    
    //MARK:-
    //note : UIApplication.shared.keyWindow is deprecated in ios 13, so use -> UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
    private let notificationView = Bundle(for: mfNotification.self).loadNibNamed("mfNotificationCore", owner: nil, options: [:])![0] as! mfNotificationCore
    private let keyWindows = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!
    private var topSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return keyWindows.safeAreaInsets.top
        } else {
            return 20
        }
    }
    private var cnsTop = NSLayoutConstraint()
    private var presented = false
    private var info: Any?
    
    
    //MARK:- they can set before present
    public weak var delegate: mfNotificationDelegate? = nil
    public var attributes = mfNotificationAttributes()
    public var duration = TimeInterval(3.0)
    public var soundAlert = false
    
    //MARK:- init
    public init() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipedUp))
        swipeUp.direction = .up
        
        notificationView.isUserInteractionEnabled = true
        notificationView.addGestureRecognizer(tap)
        notificationView.addGestureRecognizer(swipeUp)
    }
    
    
    //MARK:- configure and present
    public func present(title: String,
                 text: String,
                 avatar: UIImage? = nil,
                 info: Any? = nil){
        
        if presented {
            return
        }
        presented = true
        
        self.info = info
        
        notificationView.configure(avatar: avatar, title: title, text: text, attributes: attributes)
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        keyWindows.addSubview(notificationView)
        
        cnsTop = notificationView.topAnchor.constraint(equalTo: keyWindows.topAnchor)
        cnsTop.constant = -1 * (notificationView.frame.height + 10)
        
        NSLayoutConstraint.activate([cnsTop,
                                     notificationView.leadingAnchor.constraint(equalTo: keyWindows.leadingAnchor, constant: 10),
                                     notificationView.trailingAnchor.constraint(equalTo: keyWindows.trailingAnchor, constant: -10)])
        
        keyWindows.layoutIfNeeded()
        UIView.animate(withDuration: 0.3, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.cnsTop.constant = self.topSafeArea + 8
            self.keyWindows.layoutIfNeeded()
        }, completion: nil)
        
        if soundAlert {
            AudioServicesPlayAlertSound(1105)
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            self.dismiss()
        }
        
    }
    
    
    //MARK:- dismiss
    @objc private func dismiss(){
        if self.notificationView.superview == nil {
            return
        }
        delegate?.mfNotificationWillDismiss()
        UIView.animate(withDuration: 0.25, animations: {
            self.cnsTop.constant = -1 * (self.notificationView.frame.height + 10)
            self.keyWindows.layoutIfNeeded()
        }) { (success) in
            self.notificationView.removeFromSuperview()
            self.delegate?.mfNotificationDidDismiss()
        }
    }
    
    
    //MARK:- gestures
    @objc private func swipedUp(){
        dismiss()
    }
    
    @objc private func tapped(){
        delegate?.mfNotificationClicked(info: self.info)
        dismiss()
    }
        
}

public protocol mfNotificationDelegate: class {
    func mfNotificationClicked(info: Any?)
    func mfNotificationWillDismiss()
    func mfNotificationDidDismiss()
}

public extension mfNotificationDelegate {
    func mfNotificationClicked(info: Any?){}
    func mfNotificationWillDismiss(){}
    func mfNotificationDidDismiss(){}
}
