//
//  CustomCell.swift
//  NBP
//
//  Created by Paweł Kozioł on 12/02/2020.
//  Copyright © 2020 Paweł Kozioł. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var placementDate: UILabel!
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyCode: UILabel!
    @IBOutlet weak var currencyValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
