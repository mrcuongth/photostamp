//
//  saveimage.swift
//  autolayout
//
//  Created by PC on 6/4/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit


class saveimage: UIViewController {

    @IBOutlet weak var btn_share: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btn_save: UIButton!
    @IBOutlet weak var btn_delete: UIButton!
    var aa  = [Any]()
    var img2 = UIImageView()
    var flag1 = true
    var defaultsave = true
    var customsave = false
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_share.layer.borderWidth = 1
        btn_share.layer.borderColor = UIColor.white.cgColor
        btn_share.layer.cornerRadius = 5
        btn_share.layer.masksToBounds = true
        //img2.contentMode = .left
        if flag1 == false {
            //img.contentMode = .scaleToFill
            img.image = img2.image
            // get the current date and time
           // let currentDateTime = Date()
            
            //  initialize the date formatter and set the style
           // let formatter = DateFormatter()
           // formatter.timeStyle = .medium
            //formatter.dateStyle = .long
            //print(aa[0])
               // formatter.dateFormat = "\(aa)"
            
            
            // get the date time String from the date object
            //rmatter.string(from: currentDateTime)
            //        let data = UIImagePNGRepresentation(img.image!)
            //
            //        let image = UIImage(data: data!)
            let newImage : UIImage = textToImage(drawText: "\(aa[0])" as NSString, inImage: img.image!, atPoint: CGPoint(x: 20, y: 20))
            
            img.image = newImage
        }else{
            img.image = img2.image
        }
        
         
       // print(formatter)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func Share_img(_ sender: Any) {
       // let image = UIImage(named: "camera_icn")
                let data1 = UIImagePNGRepresentation(img.image!)
        
                let image = UIImage(data: data1!)
        // set up activity view controller
        let imageToShare = [ image! ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook , UIActivityType.postToTwitter , UIActivityType.postToFlickr , UIActivityType.postToTencentWeibo , UIActivityType.postToVimeo , UIActivityType.postToWeibo]
        
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
        
        
    }
    @IBAction func back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func Btn_sv(_ sender: Any) {
        print("ok")
        let imageData = UIImagePNGRepresentation(img.image!)
        let compresedImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
       // self.view.makeToast("image saved sucsessfully", duration: 2, point: CGPoint(x: self.view.center.x, y: self.view.center.y), title: nil, image: nil, style: .init(), completion: nil)
//        let str = self.storyboard?.instantiateViewController(withIdentifier: "CustomOverlayViewController") as! CustomOverlayViewController
//        str.defaultoverlay = defaultsave
//        str.customsoverlay = customsave
//        self.navigationController?.pushViewController(str, animated: true)
        self.navigationController?.popViewController(animated: true)
        
        // display toast with an activity spinner
       // self.view.makeToastActivity(.center)
        
        // immediately hides all toast views in self.view
        //self.view.hideAllToasts()
////        let alert = UIAlertController(title: "Saved", message: "Your image has been saved", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        alert.addAction(okAction)
//        self.present(alert, animated: true, completion: nil)
    }
    
    
    func textToImage(drawText: NSString, inImage: UIImage, atPoint:CGPoint)->UIImage{
        
        // Setup the font specific variables
        let textColor: UIColor = UIColor.red
        let textFont: UIFont =  UIFont(name: "AmericanTypewriter", size: 75)!
        let textStyle  = NSAttributedString.TextEffectStyle.letterpressStyle
        
        //Setup the image context using the passed image.
        UIGraphicsBeginImageContext(inImage.size)
        
        let textFontAttributes = [
            NSAttributedStringKey.font: textFont,
            NSAttributedStringKey.foregroundColor: textColor,
            NSAttributedStringKey.textEffect : textStyle
            ] as [NSAttributedStringKey : Any]
        
        //inImage.drawInRect(CGRectMake(0, 0, inImage.size.width, inImage.size.height))
        inImage.draw(in: CGRect(x: 0, y: 0, width: inImage.size.width, height: inImage.size.height))
        //var rect: CGRect = CGRectMake(atPoint.x, atPoint.y, inImage.size.width, inImage.size.height)
        let rect: CGRect = CGRect(x: atPoint.x, y: atPoint.y, width: inImage.size.width, height: inImage.size.height)
        drawText.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        return newImage
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
