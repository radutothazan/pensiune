//
//  RezervareCell.swift
//  pensiune
//
//  Created by Radu Tothazan on 24/05/16.
//  Copyright © 2016 Radu Tothazan. All rights reserved.
//

import UIKit

class RezervareCell: UITableViewCell {

    @IBOutlet weak var dataTerminare: UILabel!
    @IBOutlet weak var dataInceput: UILabel!
    @IBOutlet weak var NumeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
