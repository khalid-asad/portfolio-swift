//
//  HomeViewController.swift
//  portfolio
//
//  Created by Khalid Asad on 2018-05-07.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import UIKit
import PlatformCommon

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var profileView: ProfileView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var model: HomeModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = HomeModel()
        
        view.backgroundColor = ThemeManager().secondaryBackgroundColor
        
        configureProfileView()
        layoutCollectionView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return model.stackableItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCollectionViewCell
        let name = Array(model.links.keys)[indexPath.row]
        
        cell.cellTitle.text = name.uppercased()
        cell.cellTitle.textColor = ThemeManager().primaryFontColor
        cell.cellTitle.font = ThemeManager().smallTitleFont
        cell.cellImage.image = UIImage(named: name)?.withRenderingMode(.alwaysTemplate)
        collectionView.backgroundColor = ThemeManager().primaryBackgroundColor
        cell.cellImage.tintColor = ThemeManager().imageTintColor
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        return cell
    }

    @objc func tap(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self.collectionView)
        let indexPath = self.collectionView.indexPathForItem(at: location)

        guard let index = indexPath else { return }
        print("Clicked on index: " + String(index[1]))
        
        if let url = URL(string: Array(model.links.values)[index.row]), UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:])
        }
    }
}

// MARK: - Network Request via Model
extension HomeViewController {
    
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

// MARK: - Privates
extension HomeViewController {
    
    private func layoutCollectionView() {
        let cellWidth = ((UIScreen.main.bounds.width) - 32 - 30 ) / 3
        let cellLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        cellLayout?.itemSize = CGSize(width: cellWidth, height: cellWidth)
    }
    
    private func configureProfileView() {
        profileView.name = StringStore.profileName.rawValue
        profileView.title = StringStore.profileTitle.rawValue
        profileView.image = UIImage(named: "khalid")
    }
}
