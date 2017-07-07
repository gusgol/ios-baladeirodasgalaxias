//
//  ViewController.swift
//  TPAGTTG
//
//  Created by Gustavo Goldhardt on 19/06/17.
//  Copyright © 2017 Year In Code. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var background: UIImageView!
    
    let reuseIdentifier = "eventCell";
    var items = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = background.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        background.addSubview(blurEffectView)
        
        let imageUrl = "https://scontent.fpoa8-1.fna.fbcdn.net/v/t31.0-8/19452881_760695897435259_1132709206575529300_o.jpg?oh=5575d388891aee805383921275608f32&oe=59C721BA"
        
        items.append(Event(picture: imageUrl, title: "Mulher não paga", place: "Opinião"))
        items.append(Event(picture: imageUrl, title: "Festa do iPod", place: "Beco 203"))
        items.append(Event(picture: imageUrl, title: "Sextneja", place: "Woods"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! EventCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.title.text = self.items[indexPath.item].title
        cell.place.text = self.items[indexPath.item].place
        cell.downloadPicture(url: self.items[indexPath.item].picture!)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

}

