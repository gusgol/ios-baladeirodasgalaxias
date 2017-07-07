//
//  EventCellCollectionViewCell.swift
//  TPAGTTG
//
//  Created by Gustavo Goldhardt on 05/07/17.
//  Copyright © 2017 Year In Code. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func downloadPicture(url : String) {
        let url = URL(string: url)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) 
            DispatchQueue.main.async {
                self.picture.image = UIImage(data: data!)
            }
        }
    }
}
