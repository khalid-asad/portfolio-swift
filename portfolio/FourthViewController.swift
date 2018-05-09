//
//  FourthViewController.swift
//  portfolio
//
//  Created by Khalid Asad on 2018-05-07.
//  Copyright © 2018 khalidtest. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let projectNames = ["Duck Hunt Java", "Robot World", "Online Chat Database", "Image Interpolation and Filtering", "FPGA Image Decompression", "File and Folder Viewer", "Multi-threaded Shear Sort", "Recursive Fibonacci"]
    
    let imageNames = [UIImage(named: "duckhuntjava"), UIImage(named: "robotworldcplus"), UIImage(named: "socketprogrammingchat"), UIImage(named: "imageinterpolationmatlab"), UIImage(named: "imagedecompressionfpga"), UIImage(named: "fileandfolderviewer"), UIImage(named: "multithreadedshearsort"), UIImage(named: "recursivefibonaccimips")]
    
    let descriptions = ["• Independently designed the classic game “Duck Hunt” fully in Java via Object-oriented design\n• Varied speeds and number of ducks through keys and implemented level progression", "Developed efficient software in C++ to simulate multiple robots in a virtual world while avoiding collisions and moving in various methods (90%)\n• Implemented using Object-Oriented programming via Unix Operating Systems", "• Directed a team of Engineers to implement a multi-threaded file-sharing database in C/Python\n• Utilised TCP and UDP sockets to transfer files and messages between client and server\n• Implemented Multicast to form new groups of users that can communicate data privately", "• Implemented Bicubic Interpolation to effectively up-sample and down-sample images MATLAB\n• Produced functions that applied contrast, brightness, saturation, and sharpness filters onto images", "• Worked effectively in a team of two to design and implement an Image De-compressor according to the McMaster Image Compression (.mic7) specification\n• Programmed the Altera DE2 board (Cyclone II) via Quartus II in System Verilog\n• Completed all three milestones of decompression in an memory efficient manner (100%)\n• Performed various decompression methods such as Colour-space Conversion, Interpolation, Inverse Signal Transform, De-quantization and Lossless Decoding\n• Enhanced efficient time management and the ability to tackle massive projects by breaking them down through the use of state tables and finite state machines", "• Created a file and folder viewer unique for reading UNIX system data", "• Developed a shear sort algorithm with multi-threaded POSIX threads", "• Used MIPS language to develop a recursive fibonacci sequence"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardsCollectionViewCell
        cell.cardName.text = projectNames[indexPath.row]
        cell.cardImage.image = imageNames[indexPath.row]
        cell.cardDescription.text = descriptions[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
