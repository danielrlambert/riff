//
//  RiffsCell.swift
//  Riff
//
//  Created by Seby Paul on 8/1/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit

class RiffsCell: UITableViewCell {
    
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblRiffs: UILabel!
    
    var currRiff: Riff!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(riff: Riff) {
        
        currRiff = riff
        
        lblAge.text = riff.strAge
        lblRiffs.text = riff.strStatus
        
        if riff.strGender == "male" {
            viewColor.backgroundColor = UIColor.riffGreen()
        }
        else {
            viewColor.backgroundColor = UIColor.riffRed()
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
