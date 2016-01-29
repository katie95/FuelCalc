//
//  FuelTableViewController.swift
//  FuelManage
//
//  Created by Katie Ning on 12/30/15.
//  Copyright © 2015 Katie Ning. All rights reserved.
//

import UIKit

class FuelTableViewController: UITableViewController {
    var fuelInfoList: NSMutableArray!
    var parentCar: Car!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "油耗记录"
        self.tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Grouped)
        self.tableView.registerClass(FuelTableViewCell.self, forCellReuseIdentifier: "FuelCell")
        self.tableView.rowHeight = 45
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addFuelInfo:")
    
        //unarchive the fuelInfoList from filepath
        let home = NSHomeDirectory() as NSString
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString
        let pathString = String(parentCar.Name) + "fuel.data"
        let filePath = docPath.stringByAppendingPathComponent(pathString)
        let list = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath)
        if (list == nil){
            fuelInfoList = NSMutableArray()
        }else{
            fuelInfoList = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! NSMutableArray
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
        return fuelInfoList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FuelCell", forIndexPath: indexPath) as! FuelTableViewCell
        let fuelInfo = fuelInfoList[indexPath.row]
        cell.fuelInfo = fuelInfo as! FuelInfo
        cell.setCell()
        
        // Configure the cell...

        return cell
    }
    
    func addFuelInfo(sender: UIButton){
        let AddFuelVC = AddFuelViewController()
        AddFuelVC.parent = self
        showViewController(AddFuelVC, sender: self)
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
            fuelInfoList.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.archiveFuelInfoList()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let fuelInfo = fuelInfoList[indexPath.row] as! FuelInfo
        let detailFuelVC = FuelDetailViewController()
        detailFuelVC.setDetail(fuelInfo.mile, price: fuelInfo.price, liter: fuelInfo.liter, type: fuelInfo.Type, isFull: fuelInfo.isFull, date: fuelInfo.date, station: fuelInfo.station)
        showViewController(detailFuelVC, sender: self)
    }
    
    func archiveFuelInfoList(){
        let home = NSHomeDirectory() as NSString
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString
        let pathString = String(parentCar.Name) + "fuel.data"
        let filePath = docPath.stringByAppendingPathComponent(pathString)
        NSKeyedArchiver.archiveRootObject(fuelInfoList, toFile: filePath)
    }
    
    func deleteFuelInfoList(){
        let home = NSHomeDirectory() as NSString
        let docPath = home.stringByAppendingPathComponent("Documents") as NSString
        
        
        let pathString = String(parentCar.Name) + "fuel.data"
        let filePath = docPath.stringByAppendingPathComponent(pathString)
        NSKeyedArchiver.archiveRootObject(NSMutableArray(), toFile: filePath)
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
