//
//  FuelInfo.swift
//  FuelManage
//
//  Created by Katie Ning on 1/1/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//

import UIKit

class FuelInfo: NSObject, NSCoding{
   
    //a list of vars that shows the detail of the fuelinfo
    var mile: Int //里程数
    var price: Double //每升价格
    var liter: Double //加油升数
    var Type: Int //标号
    var isFull: Int //是否加满
    var date: String //日期
    var station: String //加油站名称
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.mile, forKey: "mile")
        aCoder.encodeObject(self.price, forKey: "price")
        aCoder.encodeObject(self.liter, forKey: "liter")
        aCoder.encodeObject(self.Type, forKey: "type")
        aCoder.encodeObject(self.isFull, forKey: "isFull")
        aCoder.encodeObject(self.date, forKey: "date")
        aCoder.encodeObject(self.station, forKey: "station")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.mile = aDecoder.decodeObjectForKey("mile") as! Int
        self.price = aDecoder.decodeObjectForKey("price") as! Double
        self.liter = aDecoder.decodeObjectForKey("liter") as! Double
        self.Type = aDecoder.decodeObjectForKey("type") as! Int
        self.isFull = aDecoder.decodeObjectForKey("isFull") as! Int
        self.date = aDecoder.decodeObjectForKey("date") as! String
        self.station = aDecoder.decodeObjectForKey("station") as! String
    }
    
    
    init(mile: Int, price: Double, liter: Double, Type: Int, isFull: Bool, date: String, station: String) {
        self.mile = mile
        self.price = price
        self.liter = liter
        self.Type = Type
        self.isFull = Int(isFull)
        self.date = date
        self.station = station
    }
    
    
}
