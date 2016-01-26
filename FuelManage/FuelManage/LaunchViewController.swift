//
//  LaunchViewController.swift
//  FuelManage
//
//  Created by Katie Ning on 12/30/15.
//  Copyright © 2015 Katie Ning. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
    var carTable = CarTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        //create a title for the application
        let title = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 300, height: 200))
        title.text = "油耗计算工具"
        title.center = CGPoint(x: view.frame.midX, y: 150)
        title.textAlignment = NSTextAlignment.Center
        title.font = UIFont.boldSystemFontOfSize(50)
        title.textColor = UIColor.purpleColor()
        self.view.addSubview(title)
        
        //create a button for fuel management
        let fuelButton = UIButton(type: UIButtonType.System) as UIButton
        fuelButton.frame = CGRect(x: 50, y: 50, width: 300, height: 30)
        fuelButton.setTitle("百公里油耗计算", forState: .Normal)
        fuelButton.center = CGPoint(x: view.frame.midX, y: 300)
        fuelButton.titleLabel?.font = UIFont.boldSystemFontOfSize(30)
        fuelButton.titleLabel?.textColor = UIColor.blackColor()
        self.view.addSubview(fuelButton)
        
        //add action when button clicked
        fuelButton.addTarget(self, action: "fuel_calc:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fuel_calc(sender: UIButton!){
        showViewController(carTable, sender: self)
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
