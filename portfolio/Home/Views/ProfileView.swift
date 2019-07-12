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
    
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private var isExpanded: Bool = false
    
    var didTapImage: ((UIView) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileNameLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        profileTitleLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        [profileNameLabel, profileTitleLabel].forEach() {
            $0.textColor = UIColor.black
        }
    }
}

// MARK: - Internal Methods
extension ProfileView {
    
    static func create(image: UIImage?, name: String?, title: String?) -> ProfileView {
        let view: ProfileView = .fromNiib()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(image: image, name: name, title: title)
        return view
    }
}

// MARK: - Private Methods
extension ProfileView {
    
    private func configure(image: UIImage?, name: String?, title: String?) {
        profileNameLabel.configure(text: name)
        profileTitleLabel.configure(text: title)
        if let image = image {
            imageView.image = image
        }
    }
}

// MARK: - IBActions
//extension ProfileView {
//    
//    @IBAction func didTapImage(_ sender: UITapGestureRecognizer) {
//        let imageView = sender.view as! UIImageView
//        let newImageView = UIImageView(image: imageView.image)
//        newImageView.frame = UIScreen.main.bounds
//        newImageView.backgroundColor = .black
//        newImageView.contentMode = .scaleAspectFit
//        newImageView.isUserInteractionEnabled = true
//        didTapImage?(newImageView)
//    }
//}

extension UIView {
    public class func fromNiib<T: UIView>() -> T {
        // swiftlint:disable force_unwrapping
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
