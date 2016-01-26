//
//  CarTableViewCell.swift
//  FuelManage
//
//  Created by Katie Ning on 12/30/15.
//  Copyright © 2015 Katie Ning. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    var car: Car!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    func setCell(){
        for x in self.subviews{
            x.removeFromSuperview()
        }
        if (car != nil){
            let NameLabel = UILabel(frame: CGRect(x: 50, y: 50, width: self.viewForFirstBaselineLayout.frame.width/2 + 30, height: 50))
            NameLabel.center = CGPoint(x: NameLabel.frame.width/2 + 20, y: 30)
            NameLabel.text = "车辆名称：" + String(car.Name)
            NameLabel.font = UIFont.boldSystemFontOfSize(18)
            self.viewForFirstBaselineLayout.addSubview(NameLabel)
        
            let TypeLabel = UILabel(frame: CGRect(x: 50, y: 50, width: self.viewForFirstBaselineLayout.frame.width/2 + 30, height: 50))
            TypeLabel.center = CGPoint(x: NameLabel.frame.width/2 + 20, y: 70)
            TypeLabel.text = "车辆类型：" + String(car.Type)
            TypeLabel.font = UIFont.boldSystemFontOfSize(18)
            self.viewForFirstBaselineLayout.addSubview(TypeLabel)
            
            let ConsumpLabel = UILabel(frame: CGRect(x: 50, y: 50, width: self.viewForFirstBaselineLayout.frame.width/2 - 30, height: 50))
            ConsumpLabel.center = CGPoint(x: self.viewForFirstBaselineLayout.frame.midX + ConsumpLabel.frame.width/2 + 30, y: 30)
            ConsumpLabel.text = "百公里油耗："
            ConsumpLabel.textAlignment = NSTextAlignment.Right
            ConsumpLabel.textColor = UIColor.redColor()
            ConsumpLabel.font = UIFont.boldSystemFontOfSize(18)
            self.viewForFirstBaselineLayout.addSubview(ConsumpLabel)
            
            let NumberLabel = UILabel(frame: CGRect(x: 50, y: 50, width: self.viewForFirstBaselineLayout.frame.width/2 - 30, height: 50))
            NumberLabel.center = CGPoint(x: self.viewForFirstBaselineLayout.frame.midX + ConsumpLabel.frame.width/2 + 10, y: 70)
            NumberLabel.text = String(car.Consumption) + "  xl/100km"
            NumberLabel.textAlignment = NSTextAlignment.Right
            NumberLabel.textColor = UIColor.redColor()
            NumberLabel.font = UIFont.boldSystemFontOfSize(18)
            self.viewForFirstBaselineLayout.addSubview(NumberLabel)

        }
    }

}
