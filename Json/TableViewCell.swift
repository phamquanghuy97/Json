//
//  TableViewCell.swift
//  Json
//
//  Created by Phạm Huy on 5/24/19.
//  Copyright © 2019 Phạm Huy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var Img_avarta: UIImageView!
    @IBOutlet weak var fullname_lbl: UILabel!
    @IBOutlet weak var ID_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
