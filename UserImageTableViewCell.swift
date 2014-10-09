//
//  UserImageTableViewCell.swift
//  TwitterClone
//
//  Created by Kori Kolodziejczak on 10/7/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit

class UserImageTableViewCell: UITableViewCell {

  @IBOutlet weak var twitterImage: UIImageView!
  @IBOutlet weak var twitterLabel: UILabel!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
