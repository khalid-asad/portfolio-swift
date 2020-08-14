//
//  UIConfigureable.swift
//  PlatformCommon
//
//  Created by Khalid Asad on 2019-06-24.
//  Copyright © 2019 Khalid Asad. All rights reserved.
//

import Foundation
import UIKit

public protocol UITextConfigureable {
    
    func configure(text: String?)
}

extension UILabel: UITextConfigureable {
    
    public func configure(text: String?) {
        if let text = text {
            self.text = text
        } else {
            self.isHidden = true
        }
    }
}
