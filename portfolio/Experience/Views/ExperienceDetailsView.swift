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
        
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        datesLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        descriptionLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        
        [titleLabel, datesLabel, descriptionLabel].forEach() {
            $0.textColor = UIColor.black
        }
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
}
