//
//  ProfileView.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-11.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation
import UIKit

final class ProfileView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    public var name: String? {
        get {
            return profileNameLabel.text
        }
        set {
            profileNameLabel.text = newValue
        }
    }
    
    public var title: String? {
        get {
            return profileTitleLabel.text
        }
        set {
            profileTitleLabel.text = newValue
        }
    }
    
    public var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    //initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        contentView.backgroundColor = ThemeManager().secondaryBackgroundColor
        
        profileNameLabel.font = ThemeManager().titleFont
        profileTitleLabel.font = ThemeManager().subTitleFont
        
        [profileNameLabel, profileTitleLabel].forEach {
            $0.textColor = ThemeManager().secondaryFontColor
        }
    }
}
