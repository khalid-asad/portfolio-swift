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
    
    let skillNames = ["Swift", "iOS", "Android", "Java", "Python", "C", "Embedded", "C++", "XML", "JavaScript", "PHP", "SQL", "CSS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.backgroundColor = ThemeManager().primaryBackgroundColor
        collectionView.backgroundColor = ThemeManager().primaryBackgroundColor
        
        layoutCollectionView()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return skillNames.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        cell.imageCell.setImage(UIImage(named: skillNames[indexPath.row].prefix(1).lowercased()), for: .normal)
        cell.imageCell.showsTouchWhenHighlighted = true
        cell.labelCell.text = skillNames[indexPath.row]
        cell.labelCell.font = ThemeManager().subHeaderFont
        cell.labelCell.textColor = ThemeManager().secondaryBackgroundColor
        cell.backgroundColor = ThemeManager().primaryBackgroundColor
        return cell
    }
}

// MARK: - Privates
extension SkillsViewController {
    
    private func layoutCollectionView() {
        let cellWidth = ((UIScreen.main.bounds.width) - 32 - 30 ) / 3
        let cellLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        cellLayout?.itemSize = CGSize(width: cellWidth, height: cellWidth + UIScreen.main.bounds.height/16)
    }
}
