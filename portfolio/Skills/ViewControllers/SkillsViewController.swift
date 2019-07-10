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
    
    let mainMenu = ["s", "i", "a", "j", "p", "c", "e", "c", "x", "j", "p", "s", "c"]
    let skillNames = ["Swift", "iOS", "Android", "Java", "Python", "C", "Embedded", "C++", "XML", "JavaScript", "PHP", "SQL", "CSS"]
    
    override func viewDidLoad() {
        collectionView.delegate = self
        collectionView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return mainMenu.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        cell.imageCell.setImage(UIImage(named: mainMenu[indexPath.row]), for: .normal)
        cell.imageCell.showsTouchWhenHighlighted = true
        cell.labelCell.text = skillNames[indexPath.row]
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
