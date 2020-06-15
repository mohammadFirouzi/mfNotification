//
//  mfNotificationCore.swift
//  mfNotificationProj
//
//  Created by Mohammad Firouzi on 6/14/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import UIKit

class mfNotificationCore: UIView {

    //MARK:-
    @IBOutlet weak var vwAvatar: UIView!
    @IBOutlet weak var imgAvatar: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblText: UILabel!
    
    
    //MARK:-
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgAvatar.layer.cornerRadius = imgAvatar.frame.height/2
    }
    
    
    //MARK:-
    func configure(avatar: UIImage?, title: String, text: String, attributes: mfNotificationAttributes) {
        
        self.backgroundColor = attributes.backgroundColor
        self.layer.cornerRadius = attributes.cornerRadius
        
        self.layer.shadowColor = attributes.shadowColor.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 6
        
        if avatar == nil {
            vwAvatar.isHidden = true
        } else {
            vwAvatar.isHidden = false
            imgAvatar.image = avatar!
        }
        
        lblTitle.text = title
        lblTitle.font = attributes.titleFont
        lblTitle.textColor = attributes.titleColor
        
        lblText.text = text
        lblText.font = attributes.textFont
        lblText.textColor = attributes.textColor
        lblText.numberOfLines = attributes.textNumberOfLines
                
    }

}
