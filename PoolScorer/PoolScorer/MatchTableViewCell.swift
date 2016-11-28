//
//  MatchTableViewCell.swift
//  PoolScorer
//
//  Created by Liang Rui on 11/12/16.
//  Copyright © 2016 PoolDoctor. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    @IBOutlet weak var matchName: UILabel!
    @IBAction func onButtonAction(_ sender: AnyObject) {
    }
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var matchStatus: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
