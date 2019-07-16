//
//  ExperienceDetailsView.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-14.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation
import UIKit

final class ExperienceDetailsView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTheme()
    }
}

// MARK: - Internal Methods
extension ExperienceDetailsView {
    
    static func create(image: UIImage?, title: String?, dates: String?, description: String?) -> ExperienceDetailsView {
        let view: ExperienceDetailsView = .fromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(image: image, title: title, dates: dates, description: description)
        return view
    }
}

// MARK: - Private Methods
extension ExperienceDetailsView {
    
    private func configure(image: UIImage?, title: String?, dates: String?, description: String?) {
        titleLabel.configure(text: title)
        datesLabel.configure(text: dates)
        descriptionLabel.configure(text: description)
        if let image = image {
            imageView.image = image
        }
    }
    
    private func setUpTheme() {
        titleLabel.font = ThemeManager().titleFont
        datesLabel.font = ThemeManager().subTitleFont
        descriptionLabel.font = ThemeManager().subTitleFont
        
        backgroundColor = ThemeManager().primaryBackgroundColor
        
        [titleLabel, datesLabel, descriptionLabel].forEach() {
            $0.textColor = ThemeManager().primaryFontColor
        }
    }
}
