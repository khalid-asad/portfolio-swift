//
//  ExperienceDetailsViewController.swift
//  portfolio
//
//  Created by Khalid Asad on 2019-07-14.
//  Copyright © 2019 khalidtest. All rights reserved.
//

import Foundation
import UIKit

typealias ExperienceDetails = (image: UIImage?, title: String?, dates: String?, description: String?)

class ExperienceDetailsViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    var experienceDetails: ExperienceDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let experienceDetails = experienceDetails else { return }
        
        view.backgroundColor = ThemeManager().primaryBackgroundColor
        
        title = experienceDetails.title
        
        configureExperienceDetailsView(experienceDetails: experienceDetails)
    }
}

extension ExperienceDetailsViewController {
    
    func configureExperienceDetailsView(experienceDetails: ExperienceDetails) {
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        let view = ExperienceDetailsView.create(image: experienceDetails.image, title: experienceDetails.title, dates: experienceDetails.dates, description: experienceDetails.description)
        stackView.addArrangedSubview(UIView.createView(withSubview: view, edgeInsets: .zero))
    }
}
