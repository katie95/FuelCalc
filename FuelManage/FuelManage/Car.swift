//
//  Car.swift
//  FuelManage
//
//  Created by Katie Ning on 12/30/15.
//  Copyright © 2015 Katie Ning. All rights reserved.
//

import UIKit

class Car: NSObject, NSCoding{
    var Name: NSString
    var Type: NSString
    var Note: NSString
    var Consumption: NSNumber
    var FuelInfo: FuelTableViewController
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.Name, forKey: "name")
        aCoder.encodeObject(self.Type, forKey: "type")
        aCoder.encodeObject(self.Note, forKey: "note")
        aCoder.encodeObject(self.Consumption, forKey: "consumption")
        aCoder.encodeObject(self.FuelInfo, forKey: "fuelinfo")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.Name = aDecoder.decodeObjectForKey("name") as! NSString
        self.Type = aDecoder.decodeObjectForKey("type") as! NSString
        self.Note = aDecoder.decodeObjectForKey("note") as! NSString
        self.Consumption = aDecoder.decodeObjectForKey("consumption") as! NSNumber
        self.FuelInfo = aDecoder.decodeObjectForKey("fuelinfo") as! FuelTableViewController
    }
    
    init(name: NSString, type: NSString, note: NSString) {
        self.Name = name
        self.Type = type
        self.Note = note
        self.Consumption = 0.0
        self.FuelInfo = FuelTableViewController()
    }
}
