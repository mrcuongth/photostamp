//
//  tbldatecell.swift
//  autolayout
//
//  Created by PC on 6/5/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit

class tbldatecell: UITableViewCell {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//img.isHidden = true
        // Configure the view for the selected state
    }

}
