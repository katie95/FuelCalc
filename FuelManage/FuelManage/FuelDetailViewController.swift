//
//  FuelDetailViewController.swift
//  FuelManage
//
//  Created by Katie Ning on 1/1/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//

import UIKit

class FuelDetailViewController: UIViewController {
    var leftcenterX = 120
    var rightcenterX = 270
    var mile = UILabel(frame: CGRect(x: 207, y: 50, width: 120, height: 20))
    var price = UILabel(frame: CGRect(x: 207, y: 50, width: 120, height: 20))
    var liter = UILabel(frame: CGRect(x: 207, y: 50, width: 120, height: 20))
    var type = UILabel(frame: CGRect(x: 207, y: 50, width: 120, height: 20))
    var isFull = UILabel(frame: CGRect(x: 207, y: 50, width: 120, height: 20))
    var date = UILabel(frame: CGRect(x: 207, y: 50, width: 120, height: 20))
    var station = UILabel(frame: CGRect(x: 207, y: 50, width: 120, height: 20))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "详细记录"
        
        let mileLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        mileLabel.text = "车辆里程"
        mileLabel.center = CGPoint(x: leftcenterX , y: 130)
        mileLabel.font = UIFont.boldSystemFontOfSize(20)
        mileLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(mileLabel)
        
        mile.center = CGPoint(x: rightcenterX , y: 130)
        mile.font = UIFont.boldSystemFontOfSize(20)
        mile.textAlignment = NSTextAlignment.Center
        self.view.addSubview(mile)
        
        let priceLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        priceLabel.text = "每升价格"
        priceLabel.center = CGPoint(x: leftcenterX , y:200)
        priceLabel.font = UIFont.boldSystemFontOfSize(20)
        priceLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(priceLabel)
        
        price.center = CGPoint(x: rightcenterX , y: 200)
        price.font = UIFont.boldSystemFontOfSize(20)
        price.textAlignment = NSTextAlignment.Center
        self.view.addSubview(price)
        
        let literLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        literLabel.text = "加油升数"
        literLabel.center = CGPoint(x: leftcenterX , y:270)
        literLabel.font = UIFont.boldSystemFontOfSize(20)
        literLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(literLabel)
        
        liter.center = CGPoint(x: rightcenterX , y: 270)
        liter.font = UIFont.boldSystemFontOfSize(20)
        liter.textAlignment = NSTextAlignment.Center
        self.view.addSubview(liter)
        
        let typeLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        typeLabel.text = "加油标号"
        typeLabel.center = CGPoint(x: leftcenterX , y:340)
        typeLabel.font = UIFont.boldSystemFontOfSize(20)
        typeLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(typeLabel)
        
        type.center = CGPoint(x: rightcenterX , y: 340)
        type.font = UIFont.boldSystemFontOfSize(20)
        type.textAlignment = NSTextAlignment.Center
        self.view.addSubview(type)
        
        let isFullLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        isFullLabel.text = "是否加满"
        isFullLabel.center = CGPoint(x: leftcenterX, y:410)
        isFullLabel.font = UIFont.boldSystemFontOfSize(20)
        isFullLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(isFullLabel)
        
        isFull.center = CGPoint(x: rightcenterX , y: 410)
        isFull.font = UIFont.boldSystemFontOfSize(20)
        isFull.textAlignment = NSTextAlignment.Center
        self.view.addSubview(isFull)
        
        let dateLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        dateLabel.text = "加油日期"
        dateLabel.center = CGPoint(x: leftcenterX, y:480)
        dateLabel.font = UIFont.boldSystemFontOfSize(20)
        dateLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(dateLabel)
        
        date.center = CGPoint(x: rightcenterX , y: 480)
        date.font = UIFont.boldSystemFontOfSize(20)
        date.textAlignment = NSTextAlignment.Center
        self.view.addSubview(date)
        
        let stationLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        stationLabel.text = "加油站名"
        stationLabel.center = CGPoint(x: leftcenterX , y:560)
        stationLabel.font = UIFont.boldSystemFontOfSize(20)
        stationLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(stationLabel)
        
        station.center = CGPoint(x: rightcenterX , y: 560)
        station.font = UIFont.boldSystemFontOfSize(20)
        station.textAlignment = NSTextAlignment.Center
        self.view.addSubview(station)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setDetail(mile: Int, price: Double, liter: Double, type: Int, isFull: Int, date: String, station: String){
        self.mile.text = String(mile)
        self.price.text = String(price)
        self.liter.text = String(liter)
        self.type.text = String(type)
        self.isFull.text = String(Bool(isFull))
        self.date.text = date
        self.station.text = station
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
