//
//  ProjectView.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-12.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation
import UIKit

final class ProjectView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        projectLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        descriptionLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        [projectLabel, descriptionLabel].forEach() {
            $0.textColor = UIColor.black
        }
        
        addBorder(color: .black, width: 1)
        setRoundedCorners(radius: 4)
    }
}

// MARK: - Internal Methods
extension ProjectView {
    
    static func create(image: UIImage?, project: String?, description: String?) -> ProjectView {
        let view: ProjectView = .fromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(image: image, project: project, description: description)
        return view
    }
}

// MARK: - Private Methods
extension ProjectView {
    
    private func configure(image: UIImage?, project: String?, description: String?) {
        projectLabel.configure(text: project)
        descriptionLabel.configure(text: description)
        if let image = image {
            imageView.image = image
        }
    }
}
