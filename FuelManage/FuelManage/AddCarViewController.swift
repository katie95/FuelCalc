//
//  AddCarViewController.swift
//  addManage
//
//  Created by Katie Ning on 12/30/15.
//  Copyright © 2015 Katie Ning. All rights reserved.
//

import UIKit

class AddCarViewController: UIViewController {
    var parent: CarTableViewController!
    let nameField = UITextField(frame: CGRect(x: 20, y: 50, width: 200, height: 35))
    let typeField = UITextField(frame: CGRect(x: 20, y: 50, width: 200, height: 35))
    let otherField = UITextField(frame: CGRect(x: 20, y: 50, width: 200, height: 35))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGrayColor()
        self.title = "添加车辆"
        
        
        let nameLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        nameLabel.text = "车辆名称"
        nameLabel.center = CGPoint(x: nameLabel.frame.width/2 + 50 , y: 130)
        nameLabel.font = UIFont.boldSystemFontOfSize(20)
        nameLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(nameLabel)
        
        nameField.text = ""
        nameField.borderStyle = UITextBorderStyle.RoundedRect
        nameField.center = CGPoint(x: nameLabel.center.x + nameLabel.frame.width/2 + 100, y: 130)
        nameField.font = UIFont.boldSystemFontOfSize(20)
        self.view.addSubview(nameField)
        
        
        let typeLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        typeLabel.text = "车辆类型"
        typeLabel.center = CGPoint(x: nameLabel.frame.width/2 + 50 , y:200)
        typeLabel.font = UIFont.boldSystemFontOfSize(20)
        typeLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(typeLabel)
        
        typeField.text = ""
        typeField.borderStyle = UITextBorderStyle.RoundedRect
        typeField.center = CGPoint(x: nameLabel.center.x + nameLabel.frame.width/2 + 100, y: 200)
        typeField.font = UIFont.boldSystemFontOfSize(20)
        self.view.addSubview(typeField)
        
        let otherLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        otherLabel.text = "其他信息"
        otherLabel.center = CGPoint(x: nameLabel.frame.width/2 + 50 , y:270)
        otherLabel.font = UIFont.boldSystemFontOfSize(20)
        otherLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(otherLabel)
        
        otherField.text = ""
        otherField.borderStyle = UITextBorderStyle.RoundedRect
        otherField.center = CGPoint(x: nameLabel.center.x + nameLabel.frame.width/2 + 100, y: 270)
        otherField.font = UIFont.boldSystemFontOfSize(20)
        self.view.addSubview(otherField)
        
        let addButton = UIButton(type: UIButtonType.System) as UIButton
        addButton.frame = CGRect(x: 50, y: 50, width: 300, height: 20)
        addButton.setTitle("添加", forState: .Normal)
        addButton.center = CGPoint(x: view.frame.midX, y: 340)
        addButton.titleLabel?.font = UIFont.boldSystemFontOfSize(20)
        addButton.titleLabel?.textColor = UIColor.blackColor()
        self.view.addSubview(addButton)
        
        //add action when button clicked
        addButton.addTarget(self, action: "addCar:", forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addCar(sender: UIButton!){
        let newCar = Car(name: nameField.text!, type: typeField.text!, note: otherField.text!)
        parent.carList.addObject(newCar)
        parent.archiveCarList()
        nameField.text = ""
        typeField.text = ""
        otherField.text = ""
        nameField.becomeFirstResponder()
        parent.tableView.reloadData()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.nameField.resignFirstResponder()
        self.typeField.resignFirstResponder()
        self.otherField.resignFirstResponder()
    }
    
    override func viewDidDisappear(animated: Bool) {
        nameField.text = ""
        typeField.text = ""
        otherField.text = ""
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
