//
//  FuelTableViewCell.swift
//  FuelManage
//
//  Created by Katie Ning on 1/1/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//

import UIKit

class FuelTableViewCell: UITableViewCell {
    var fuelInfo: FuelInfo!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell() {
        for x in self.subviews{
            x.removeFromSuperview()
        }
        if (fuelInfo != nil){
            let DateLabel = UILabel(frame: CGRect(x: 20, y: 0, width: self.viewForFirstBaselineLayout.frame.width, height: 50))
            DateLabel.text = fuelInfo.date as String
            DateLabel.font = UIFont.boldSystemFontOfSize(25)
            self.viewForFirstBaselineLayout.addSubview(DateLabel)
        }
    }

}
