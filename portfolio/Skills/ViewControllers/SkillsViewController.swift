//
//  SkillsViewController.swift
//  portfolio
//
//  Created by Khalid Asad on 2018-05-07.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var model: SkillsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = SkillsModel()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setUpTheme()
        layoutCollectionView()
        fetchData()
    }
}

// MARK: - UICollectionView Methods
extension SkillsViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.stackableItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.skillLabel.font = ThemeManager().subTitleFont
        cell.skillLabel.textColor = ThemeManager().secondaryBackgroundColor
        cell.yearsOfExperienceLabel.font = ThemeManager().subHeaderFont
        cell.yearsOfExperienceLabel.textColor = ThemeManager().secondaryBackgroundColor
        cell.backgroundColor = ThemeManager().primaryBackgroundColor
        
        switch model.stackableItems[indexPath.row] {
        case .skill(let skill, let yearsOfExperience):
            guard let skill = skill else { return cell }
            cell.imageView.image = UIImage(named: skill.prefix(1).lowercased())
            cell.skillLabel.text = skill
            cell.yearsOfExperienceLabel.text = String(yearsOfExperience ?? 1) + "y"
        }

        return cell
    }
}

// MARK: - Network Request via Model
extension SkillsViewController {
    
    func fetchData(_ complete: (() -> Void)? = nil) {
        model.fetchData(completion: { [unowned self] status in
            switch status {
            case .success:
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            default:
                break
            }
        })
    }
}

// MARK: - Private Methods
extension SkillsViewController {
    
    private func layoutCollectionView() {
        let cellWidth = ((UIScreen.main.bounds.width) - 32 - 30 ) / 3
        let cellLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        cellLayout?.itemSize = CGSize(width: cellWidth, height: cellWidth + 32)
    }
    
    private func setUpTheme() {
        view.backgroundColor = ThemeManager().primaryBackgroundColor
        collectionView.backgroundColor = ThemeManager().primaryBackgroundColor
    }
}
