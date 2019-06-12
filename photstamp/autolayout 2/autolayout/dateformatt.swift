//
//  dateformatt.swift
//  autolayout
//
//  Created by PC on 6/5/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit

class dateformatt: UIViewController , UITableViewDelegate , UITableViewDataSource{
    var arr = [Any]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    var datetag = [Any]()
    var defaults = true
    var customs = false
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tbldatecell
        cell.lbl.text = arr[indexPath.row] as? String
        
        return cell
        
    }
    
    @IBOutlet weak var Custom_switch: UISwitch!
    @IBOutlet weak var Default_switch: UISwitch!
    @IBOutlet weak var v1: UIView!
    
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var tbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.isUserInteractionEnabled = false
        f1()
        f2()
        f3()
        f4()
        f5()
        f6()
        f7()
        f8()
        f9()
        v1.layer.borderWidth = 2
        v1.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.2).cgColor
        v2.layer.borderWidth = 2
        v2.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.2).cgColor
        tbl.layer.borderWidth = 2
        tbl.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.2).cgColor
        //Custom_switch.transform = CGAffineTransform(scaleX: 0.0020*self.view.frame.size.width, y: 0.00099*self.view.frame.size.height)
        //Default_switch.transform = CGAffineTransform(scaleX: 0.0020*self.view.frame.size.width, y: 0.00099*self.view.frame.size.height)
        Custom_switch.isOn = customs
        Default_switch.isOn = defaults
        
        // Do any additional setup after loading the view.
    }
    func f1 (){
        let currentDateTime = Date()
        
        //  initialize the date formatter and set the style
        let formatter = DateFormatter()
        //formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "dd MMM yyyy"
        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        arr.append(formatter.string(from: currentDateTime))
        print(formatter.string(from: currentDateTime))
    }
    func f2 (){
        let currentDateTime = Date()
        
        //  initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "dd MMM yyyy hh:mm:ss a"
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        arr.append(formatter.string(from: currentDateTime))
        print(formatter.string(from: currentDateTime))
    }
    func f3 (){
        let currentDateTime = Date()
        //  initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "dd MMM hh:mm a"
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        arr.append(formatter.string(from: currentDateTime))
        print(formatter.string(from: currentDateTime))
    }
    func f4 (){
        let currentDateTime = Date()
        
        //  initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "dd MMM yyyy hh:mma"
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        arr.append(formatter.string(from: currentDateTime))
        print(formatter.string(from: currentDateTime))
    }
    func f5 (){
        let currentDateTime = Date()
        
        //  initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "yyyy.MM.dd 'AD' 'at' HH:mm:ss zzz"
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        arr.append(formatter.string(from: currentDateTime))
        print(formatter.string(from: currentDateTime))
    }
    func f6 (){
        let currentDateTime = Date()
        
        //  initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "E','MMM dd','''yy "
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        arr.append(formatter.string(from: currentDateTime))
        print(formatter.string(from: currentDateTime))
    }
    func f7 (){
        let currentDateTime = Date()
        
        //  initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "h':'mm a"
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        arr.append(formatter.string(from: currentDateTime))
        print(formatter.string(from: currentDateTime))
    }
    func f8 (){
        let currentDateTime = Date()
        
        //  initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "hh 'o''clock' a',India Standard Time'"
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        arr.append(formatter.string(from: currentDateTime))
        print(formatter.string(from: currentDateTime))
    }
    func f9 (){
        let currentDateTime = Date()
        
        //  initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        formatter.dateFormat = "h':'m a','zzz"
        
        // get the date time String from the date object
        formatter.string(from: currentDateTime)
        arr.append(formatter.string(from: currentDateTime))
        print(formatter.string(from: currentDateTime))
    }
    
    @IBAction func back(_ sender: Any) {
        
        let str = self.storyboard?.instantiateViewController(withIdentifier: "CustomOverlayViewController") as! CustomOverlayViewController
        str.customsoverlay = customs
        str.defaultoverlay = defaults
        str.formatter = datetag
        
        self.navigationController?.pushViewController(str, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultswitch(_ sender: Any) {
      
      if Default_switch.isOn == true {
            defaults = true
            customs = false
            Custom_switch.isOn = false
        tbl.isUserInteractionEnabled = false
      }else if Default_switch.isOn == false {
        defaults = false
        customs = true
            Custom_switch.isOn = true
        tbl.isUserInteractionEnabled = true
        }
        
        
    }
    @IBAction func customswitch(_ sender: Any) {
        if Custom_switch.isOn == true {
            defaults = false
            customs = true
            tbl.isUserInteractionEnabled = true
        Default_switch.isOn = false
        }else if Custom_switch.isOn == false {
            defaults = true
            customs = false
            tbl.isUserInteractionEnabled = false
            Default_switch.isOn = true
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        datetag.removeAll()
        datetag.append(arr[indexPath.row])
        let select : Int = indexPath.row
        print(select)
       
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tbldatecell
        let c = tableView.cellForRow(at: indexPath) as! tbldatecell
        c.lbl.text = arr[indexPath.row] as? String
       // cell.img.isHidden = true
        
            if select == indexPath.row {
                c.img.isHidden = false
            } else if select != indexPath.row {
                c.img.isHidden = false
            }

        
        
        
        
        
        print(datetag)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let select : Int = indexPath.row
        print(select)
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tbldatecell
        let c = tableView.cellForRow(at: indexPath) as! tbldatecell
        c.lbl.text = arr[indexPath.row] as? String
        // cell.img.isHidden = true
        
         if select == indexPath.row {
            c.img.isHidden = true
        }
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
