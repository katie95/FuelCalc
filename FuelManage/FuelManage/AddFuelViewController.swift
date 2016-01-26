//
//  AddFuelViewController.swift
//  FuelManage
//
//  Created by Katie Ning on 1/1/16.
//  Copyright © 2016 Katie Ning. All rights reserved.
//

import UIKit

class AddFuelViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var parent: FuelTableViewController!
    let mileField = UITextField(frame: CGRect(x: 20, y: 50, width: 200, height: 35))
    let priceField = UITextField(frame: CGRect(x: 20, y: 50, width: 200, height: 35))
    let literField = UITextField(frame: CGRect(x: 20, y: 50, width: 200, height: 35))
    let typeField = UITextField(frame: CGRect(x: 20, y: 50, width: 200, height: 35))
    var isFull: UIPickerView!
    var dateField: UIDatePicker!
    let stationField = UITextField(frame: CGRect(x: 20, y: 50, width: 200, height: 35))
    var leftcenterX = 80
    var rightcenterX = 270
    var alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
    var picker = 0 //represent the choice user picks, 0, 1 or 2

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.title = "添加记录"
        
        let cancelAction = UIAlertAction(title: "返回", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let mileLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        mileLabel.text = "车辆里程"
        mileLabel.center = CGPoint(x: leftcenterX , y: 130)
        mileLabel.font = UIFont.boldSystemFontOfSize(20)
        mileLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(mileLabel)
        
        
        mileField.text = ""
        mileField.delegate = self
        mileField.borderStyle = UITextBorderStyle.RoundedRect
        mileField.center = CGPoint(x: rightcenterX, y: 130)
        mileField.font = UIFont.boldSystemFontOfSize(20)
        mileField.keyboardType = UIKeyboardType.NumberPad
        self.view.addSubview(mileField)
        
        
        let priceLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        priceLabel.text = "每升价格"
        priceLabel.center = CGPoint(x: leftcenterX , y:200)
        priceLabel.font = UIFont.boldSystemFontOfSize(20)
        priceLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(priceLabel)
        
        priceField.text = ""
        priceField.delegate = self
        priceField.borderStyle = UITextBorderStyle.RoundedRect
        priceField.center = CGPoint(x: rightcenterX, y: 200)
        priceField.font = UIFont.boldSystemFontOfSize(20)
        priceField.keyboardType = UIKeyboardType.DecimalPad
        self.view.addSubview(priceField)
        
        let literLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        literLabel.text = "加油升数"
        literLabel.center = CGPoint(x: leftcenterX , y:270)
        literLabel.font = UIFont.boldSystemFontOfSize(20)
        literLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(literLabel)
        
        literField.text = ""
        literField.delegate = self
        literField.borderStyle = UITextBorderStyle.RoundedRect
        literField.center = CGPoint(x: rightcenterX, y: 270)
        literField.font = UIFont.boldSystemFontOfSize(20)
        literField.keyboardType = UIKeyboardType.DecimalPad
        self.view.addSubview(literField)
        
        let typeLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        typeLabel.text = "加油标号"
        typeLabel.center = CGPoint(x: leftcenterX , y:340)
        typeLabel.font = UIFont.boldSystemFontOfSize(20)
        typeLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(typeLabel)
        
        typeField.text = ""
        typeField.delegate = self
        typeField.borderStyle = UITextBorderStyle.RoundedRect
        typeField.center = CGPoint(x: rightcenterX, y: 340)
        typeField.font = UIFont.boldSystemFontOfSize(20)
        typeField.keyboardType = UIKeyboardType.NumberPad
        self.view.addSubview(typeField)
        
        
        let isFullLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        isFullLabel.text = "是否加满"
        isFullLabel.center = CGPoint(x: leftcenterX, y:410)
        isFullLabel.font = UIFont.boldSystemFontOfSize(20)
        isFullLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(isFullLabel)
        
        isFull = UIPickerView(frame: CGRect(x: 20, y: 50, width: 200, height: 50))
        isFull.center = CGPoint(x: rightcenterX, y:410)
        isFull.delegate = self
        isFull.dataSource = self
        isFull.showsSelectionIndicator = true
        isFull.autoresizesSubviews = true
        isFull.selectRow(0, inComponent: 0, animated: true)
        self.view.addSubview(isFull)
        //self.view.addSubview(isFullField)
        
        let dateLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        dateLabel.text = "加油日期"
        dateLabel.center = CGPoint(x: leftcenterX, y:480)
        dateLabel.font = UIFont.boldSystemFontOfSize(20)
        dateLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(dateLabel)
        
        dateField = UIDatePicker(frame: CGRect(x: 20, y: 50, width: 250, height: 50))
        dateField.center = CGPoint(x: rightcenterX , y:480)
        dateField.datePickerMode = UIDatePickerMode.Date

        self.view.addSubview(dateField)
        
        let stationLabel = UILabel(frame: CGRect(x: view.frame.midX, y: 50, width: 120, height: 20))
        stationLabel.text = "加油站名"
        stationLabel.center = CGPoint(x: leftcenterX , y:560)
        stationLabel.font = UIFont.boldSystemFontOfSize(20)
        stationLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(stationLabel)
        
        stationField.text = ""
        stationField.delegate = self
        stationField.borderStyle = UITextBorderStyle.RoundedRect
        stationField.center = CGPoint(x: rightcenterX, y: 560)
        stationField.font = UIFont.boldSystemFontOfSize(20)
        stationField.keyboardType = UIKeyboardType.Alphabet
        self.view.addSubview(stationField)
        
        let addButton = UIButton(type: UIButtonType.System) as UIButton
        addButton.frame = CGRect(x: 50, y: 50, width: 300, height: 20)
        addButton.setTitle("添加", forState: .Normal)
        addButton.center = CGPoint(x: view.frame.midX, y: 620)
        addButton.titleLabel?.font = UIFont.boldSystemFontOfSize(20)
        addButton.titleLabel?.textColor = UIColor.blackColor()
        self.view.addSubview(addButton)
        
        //add action when button clicked
        addButton.addTarget(self, action: "addInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        mileField.resignFirstResponder()
        typeField.resignFirstResponder()
        priceField.resignFirstResponder()
        literField.resignFirstResponder()
        stationField.resignFirstResponder()
    }
    
    func addInfo(sender: UIButton){
        if (mileField.text!.isEmpty){
            alert.title = "里程数为空"
            alert.message = "请键入一个正整数"
            presentViewController(alert, animated: true, completion: nil)
        }else if (literField.text!.isEmpty){
            alert.title = "加油升数为空"
            alert.message = "请键入一个正数"
            presentViewController(alert, animated: true, completion: nil)
        }else if (picker == 0){
            alert.title = "未选择是否加满"
            alert.message = "请选择‘是’或‘否’"
            presentViewController(alert, animated: true, completion: nil)
        }else{
            //key information is filled out by the user
            //continue to add
            let mile = Int(mileField.text!)
            var price = 0.0
            if (!priceField.text!.isEmpty){
                price = Double(priceField.text!)!
            }
            let liter = Double(literField.text!)
            var Type = 0
            if (!typeField.text!.isEmpty){
                Type = Int(typeField.text!)!
            }
            var isFull2 = false
            //var isFull3: String
            if (picker == 1){
                isFull2 = true
                //isFull3 = "是"
            }else{
                isFull2 = false
                //isFull3 = "否"
            }
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.stringFromDate(dateField.date)
            var station = ""
            if (!stationField.text!.isEmpty){
                station = stationField.text!
            }
            let fuelInfo = FuelInfo(mile: mile!, price: price, liter: liter!, Type: Type, isFull: isFull2, date: date, station: station)
            parent.fuelInfoList.addObject(fuelInfo)
            parent.archiveFuelInfoList()
            mileField.text = ""
            typeField.text = ""
            priceField.text = ""
            literField.text = ""
            stationField.text = ""
            isFull.selectRow(0, inComponent: 0, animated: true)
            parent.tableView.reloadData()
            
            
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (row == 0){
            return "请选择"
        }else if (row == 1){
            return "是"
        }else{
            return "否"
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (row == 0){
            picker = 0
        }else if (row == 1){
            picker = 1
        }else{
            picker = 2
        }

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let offset = textField.frame.origin.y + 120 - (self.view.frame.height - 216)
        if (offset > 0) {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.view.frame = CGRect(x: 0.0, y: -offset, width: self.view.frame.width, height: self.view.frame.height)
            })
            
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        UIView.animateWithDuration(0.5) { () -> Void in
             self.view.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height)
        }
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
