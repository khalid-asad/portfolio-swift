//
//  HomeViewController.swift
//  portfolio
//
//  Created by Khalid Asad on 2018-05-07.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import UIKit
import SafariServices

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let mainMenu = ["github", "linkedin", "website", "email", "google play", "changelog", "feedback", "star", "donate", "help"]
    let urls = ["https://www.github.com/xeroyzenith", "https://www.linkedin.com/in/khalidasad", "https://www.khalidasad93.wixsite.com/khalidasad", "www.gmail.com", "https://play.google.com/store/apps/developer?id=Khalid+Asad", "https://github.com/xeroyzenith/iOSPortfolio/commits/master", "https://play.google.com/store/apps/details?id=com.xeroy.profileapplication", "https://play.google.com/store/apps/details?id=com.xeroy.profileapplication", "https://www.paypal.me/KhalidAsad", "https://github.com/xeroyzenith/ProfileApplication/blob/master/README.md"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return mainMenu.count
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: location)
        
        if let index = indexPath{
            print("Got Clicked on index: " + String(index[1]))
        }
        
        if let url = URL(string: urls[indexPath![1]]), UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        cell.imageCell.setImage(UIImage(named: mainMenu[indexPath.row]), for: .normal)
        cell.imageCell.showsTouchWhenHighlighted = true
        cell.labelCell.text = mainMenu[indexPath.row].capitalized
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
