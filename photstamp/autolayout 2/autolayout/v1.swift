//
//  v1.swift
//  autolayout
//
//  Created by PC on 5/30/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit

class v1: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet weak var Img_Gallary: UIImageView!
    @IBOutlet weak var Img_Camera: UIImageView!
    @IBOutlet weak var lbl_glry: UILabel!
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
    var flag = true

    var picker:UIImagePickerController?=UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        //opencamera()
        toggle.transform = CGAffineTransform(scaleX: 0.0019*self.view.frame.size.width, y: 0.00099*self.view.frame.size.height)
        lbl_glry.font = UIFont.systemFont(ofSize: 0.044*self.view.frame.size.width)
        Date.font = UIFont.systemFont(ofSize: 0.046*self.view.frame.size.width)
        Location.font = UIFont.systemFont(ofSize: 0.046*self.view.frame.size.width)
        Sign.font = UIFont.systemFont(ofSize: 0.046*self.view.frame.size.width)
        logo.font = UIFont.systemFont(ofSize: 0.046*self.view.frame.size.width)
      //  Gallery.font = UIFont.systemFont(ofSize: 0.021*self.view.frame.size.height)
        camera.font = UIFont.systemFont(ofSize: 0.044*self.view.frame.size.width)
        Autostamp.font = UIFont.boldSystemFont(ofSize: 0.043*self.view.frame.size.width)
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
        v1.layer.borderWidth = 0.0045*self.view.frame.size.width
        v1.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v2.layer.borderWidth = 0.0045*self.view.frame.size.width
        v2.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v3.layer.borderWidth = 0.0045*self.view.frame.size.width
        v3.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v4.layer.borderWidth = 0.0045*self.view.frame.size.width
        v4.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v5.layer.borderWidth = 0.0045*self.view.frame.size.width
        v5.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        v6.layer.borderWidth = 0.0045*self.view.frame.size.width
        v6.layer.borderColor = UIColor.init(white: 0.7, alpha: 0.3).cgColor
        // Do any additional setup after loading the view.
        b1.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.width)
        b2.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.width)
        b3.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.width)
        b4.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.width)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(img_Camera))
        Img_Camera.isUserInteractionEnabled = true
        Img_Camera.addGestureRecognizer(tapGestureRecognizer)
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(img_Gallary))
        Img_Gallary.isUserInteractionEnabled = true
        Img_Gallary.addGestureRecognizer(tapGestureRecognizer1)
    }
    @objc func img_Gallary() {
        print("yes")
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            flag = true
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = false
           
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        
    }
    @objc func img_Camera() {
        print("yes")
        opencamera()
    
    }
    var bb = ""
    func opencamera(){
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            flag = false
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = .camera;
//            imagePicker.allowsEditing = false
//
//            self.present(imagePicker, animated: true, completion: nil)
//        }
        flag = false
        let str = self.storyboard?.instantiateViewController(withIdentifier: "CustomOverlayViewController") as! CustomOverlayViewController
        self.navigationController?.pushViewController(str, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print("donee")
        if flag==false {

        let str = self.storyboard?.instantiateViewController(withIdentifier: "saveimg") as! saveimage
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let img1 = UIImageView()
            
            img1.image = pickedImage
            str.img2.image = img1.image
            str.flag1 = flag
            //str.img.contentMode = .scaleToFill
            //str.img.image = pickedImage
            print("path is \(pickedImage)")
            self.navigationController?.pushViewController(str, animated: true)
            picker.dismiss(animated: true, completion: nil)
            
        }
        
        } else{
            let str = self.storyboard?.instantiateViewController(withIdentifier: "saveimg") as! saveimage
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
                let img4 = UIImageView()
                img4.image = pickedImage
                str.flag1 = flag
                str.img2.image = img4.image
                //str.img.contentMode = .scaleToFill
                //str.img.image = pickedImage
                print("path is \(pickedImage)")
                 self.navigationController?.pushViewController(str, animated: true)
                picker.dismiss(animated: true, completion: nil)
                
            }
           
        }
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
    
        
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            b1.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.height)
            b2.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.height)
            b3.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.height)
            b4.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.height)
            lbl_glry.font = UIFont.systemFont(ofSize: 0.035*self.v1.frame.size.width)
            Date.font = UIFont.systemFont(ofSize: 0.076*self.v3.frame.size.height)
            Location.font = UIFont.systemFont(ofSize: 0.076*self.v4.frame.size.height)
            Sign.font = UIFont.systemFont(ofSize: 0.076*self.v6.frame.size.height)
            logo.font = UIFont.systemFont(ofSize: 0.076*self.v5.frame.size.height)
            //  Gallery.font = UIFont.systemFont(ofSize: 0.021*self.view.frame.size.height)
            camera.font = UIFont.systemFont(ofSize: 0.035*self.v2.frame.size.width)
            Autostamp.font = UIFont.boldSystemFont(ofSize: 0.043*self.view.frame.size.height)
        }
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation){
            b1.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.width)
            b2.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.width)
            b3.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.width)
            b4.titleLabel?.font = UIFont.systemFont(ofSize:0.040*self.view.frame.size.width)
            
            lbl_glry.font = UIFont.systemFont(ofSize: 0.044*self.view.frame.size.width)
            Date.font = UIFont.systemFont(ofSize: 0.046*self.view.frame.size.width)
            Location.font = UIFont.systemFont(ofSize: 0.046*self.view.frame.size.width)
            Sign.font = UIFont.systemFont(ofSize: 0.046*self.view.frame.size.width)
            logo.font = UIFont.systemFont(ofSize: 0.046*self.view.frame.size.width)
            //  Gallery.font = UIFont.systemFont(ofSize: 0.021*self.view.frame.size.height)
            camera.font = UIFont.systemFont(ofSize: 0.044*self.view.frame.size.width)
            Autostamp.font = UIFont.boldSystemFont(ofSize: 0.043*self.view.frame.size.width)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
