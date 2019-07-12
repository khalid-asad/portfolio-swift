//
//  ProjectsViewController.swift
//  portfolio
//
//  Created by Khalid Asad on 2018-05-07.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    @IBOutlet weak var projectsStackView: UIStackView!
    
    var model: ProjectsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = ProjectsModel()
        
        fetchData()
    }
}

// MARK: - Network Request via Model
extension ProjectsViewController {
    
    func fetchData(_ complete: (() -> Void)? = nil) {
        model.fetchData(completion: { [unowned self] status in
            switch status {
            case .success:
                DispatchQueue.main.async {
                    self.configureStackView()
                }
            default:
                break
            }
        })
    }
}

// MARK: - Privates
extension ProjectsViewController {
    
    private func configureStackView() {
        projectsStackView.arrangedSubviews.forEach {
            projectsStackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        model.stackableItems.forEach { item in
            switch item {
            case .project(let project, let image, let description):
                addProjectView(project: project, image: image, description: description)
            }
        }
    }
    
    private func addProjectView(project: String?, image: String?, description: String?) {
        let projectView = ProjectView.create(image: UIImage(named: image ?? ""), project: project, description: description)
        projectsStackView.addArrangedSubview(UIView.createView(withSubview: projectView, edgeInsets: .project))
    }
}

extension UIEdgeInsets {
    
    fileprivate static let project: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8)
}
