//
//  ViewController.swift
//  autolayout
//
//  Created by PC on 5/24/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tbl: UITableView!
    @IBOutlet weak var menuview: UIView!
    @IBOutlet weak var camera: UILabel!
    @IBOutlet weak var Gallery: UILabel!
    @IBOutlet weak var Autostamp: UILabel!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var v: UIView!
    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var Sign: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var n1: UINavigationItem!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v6: UIView!
    @IBOutlet weak var v5: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v2: UIView!
    var MenuNamearr = ["Home","Setting","Our Apps","Say Thanks","Help & Support","Share App"]
    var Menuimgarr = ["Home","Setting","Our_Apps","Say_Thanks","Help_Support","Share_App"]
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipright))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        UINavigationBar.appearance().tintColor = UIColor.black
        toggle.transform = CGAffineTransform(scaleX: 0.0019*self.view.frame.size.width, y: 0.00099*self.view.frame.size.height)
        v1.layer.cornerRadius = 7
        self.v1.clipsToBounds = true
        v2.layer.cornerRadius = 7
        self.v2.clipsToBounds = true
        v3.layer.cornerRadius = 7
        self.v3.clipsToBounds = true
        v4.layer.cornerRadius = 7
        self.v4.clipsToBounds = true
        v5.layer.cornerRadius = 7
        self.v5.clipsToBounds = true
        v6.layer.cornerRadius = 7
        self.v6.clipsToBounds = true
        print("ll\(self.view.frame.size.height)")
       // Date.font = Date.font.withSize((1)*(self.v3.frame.size.height))
        Date.font = UIFont.systemFont(ofSize: 0.025*self.view.frame.size.height)
         Location.font = UIFont.systemFont(ofSize: 0.025*self.view.frame.size.height)
         Sign.font = UIFont.systemFont(ofSize: 0.025*self.view.frame.size.height)
         logo.font = UIFont.systemFont(ofSize: 0.025*self.view.frame.size.height)
        Gallery.font = UIFont.systemFont(ofSize: 0.021*self.view.frame.size.height)
        camera.font = UIFont.systemFont(ofSize: 0.021*self.view.frame.size.height)
       // Autostamp.font = UIFont.systemFont(ofSize: 0.025*self.view.frame.size.height)
        Autostamp.font = UIFont.boldSystemFont(ofSize: 0.0021*self.view.frame.size.height)
        // Do any additional setup after loading the view, typically from a nib.
        b1.titleLabel?.font = UIFont.systemFont(ofSize:0.020*self.view.frame.size.height)
        b2.titleLabel?.font = UIFont.systemFont(ofSize:0.020*self.view.frame.size.height)
        b3.titleLabel?.font = UIFont.systemFont(ofSize:0.020*self.view.frame.size.height)
        b4.titleLabel?.font = UIFont.systemFont(ofSize:0.020*self.view.frame.size.height)
        v1.layer.borderWidth = 0.0045*self.view.frame.size.height
        v1.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v2.layer.borderWidth = 0.0045*self.view.frame.size.height
        v2.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v3.layer.borderWidth = 0.0045*self.view.frame.size.height
        v3.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v4.layer.borderWidth = 0.0045*self.view.frame.size.height
        v4.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v5.layer.borderWidth = 0.0045*self.view.frame.size.height
        v5.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v6.layer.borderWidth = 0.0045*self.view.frame.size.height
        v6.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        
        
        
    }
    
    @objc func swipright()  {
        UIView.transition(with: menuview,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft],
                          animations: {
                            
                            self.menuview.isHidden = false
        },
                          completion: nil)
        v1.alpha = 0.3
        v2.alpha = 0.3
        v3.alpha = 0.3
        v4.alpha = 0.3
        v5.alpha = 0.3
        v6.alpha = 0.3
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuNamearr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lbl.text = "\(MenuNamearr[indexPath.row])"
        cell.lbl.font = UIFont.boldSystemFont(ofSize:0.03*self.tbl.frame.size.height)
        cell.img.image = UIImage(named: "\(Menuimgarr[indexPath.row])")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @IBAction func BarBtn(_ sender: Any) {
        if menuview.isHidden == true {
        UIView.transition(with: menuview,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft],
                          animations: {
                            
                            self.menuview.isHidden = false
        },
                          completion: nil)
        v1.alpha = 0.3
        v2.alpha = 0.3
        v3.alpha = 0.3
        v4.alpha = 0.3
        v5.alpha = 0.3
        v6.alpha = 0.3
        }
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        v1.alpha = 1
//        v2.alpha = 1
//        v3.alpha = 1
//        v4.alpha = 1
//        v5.alpha = 1
//        v6.alpha = 1
//        UIView.transition(with: menuview,
//                          duration: 0.5,
//                          options: [.transitionFlipFromRight],
//                          animations: {
//                            
//                            self.menuview.isHidden = true
//        },
//                          completion: nil)
//        
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tbl.frame.size.height*0.1
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

