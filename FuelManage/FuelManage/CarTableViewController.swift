//
//  CarTableViewController.swift
//  FuelManage
//
//  Created by Katie Ning on 12/30/15.
//  Copyright © 2015 Katie Ning. All rights reserved.
//

import UIKit

class CarTableViewController: UITableViewController{
    //create a list of car for the cartable to show
    
    var carList: NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车辆列表"
        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Grouped)
        self.tableView.registerClass(CarTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.rowHeight = 100
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addCar:")
        
        //unarchive the carList from filepath
        let home = NSHomeDirectory() as NSString
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString
        let filePath = docPath.stringByAppendingPathComponent("car.data")
        let list = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath)
        if (list == nil){
            carList = NSMutableArray()
        }else{
            carList = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! NSMutableArray
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return carList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CarTableViewCell
        let car = carList[indexPath.row]
        cell.car = car as! Car
        // Configure the cell...
        cell.setCell()
        

        return cell
    }
    
    func addCar(sender: UIBarButtonItem){
        let AddCarVC = AddCarViewController()
        AddCarVC.parent = self
        showViewController(AddCarVC, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let car = carList[indexPath.row] as! Car
            car.FuelInfo.deleteFuelInfoList()
            carList.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.archiveCarList()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let car = carList[indexPath.row] as! Car
        let fuelVC = car.FuelInfo
        fuelVC.parentCar = car
        showViewController(fuelVC, sender: self)
    }
    
    func archiveCarList(){
        let home = NSHomeDirectory() as NSString
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString
        let filePath = docPath.stringByAppendingPathComponent("car.data")
        NSKeyedArchiver.archiveRootObject(carList, toFile: filePath)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
