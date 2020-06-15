//
//  mfNotificationAttributes.swift
//  mfNotificationProj
//
//  Created by Mohammad Firouzi on 6/14/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Foundation
import UIKit

public struct mfNotificationAttributes {
    public var backgroundColor: UIColor
    public var shadowColor: UIColor = .gray
    public var cornerRadius: CGFloat = 10
    
    public var titleFont: UIFont = UIFont.systemFont(ofSize: 15, weight: .bold)
    public var titleColor: UIColor
    
    public var textNumberOfLines: Int = 3
    public var textFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .light)
    public var textColor: UIColor
    
    
    public init() {
        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
            titleColor = .label
            textColor = .label
        } else {
            backgroundColor = .white
            titleColor = .black
            textColor = .black
        }
    }
}
