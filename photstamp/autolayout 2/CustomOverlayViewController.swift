//
//  CustomOverlayViewController.swift
//  autolayout
//
//  Created by PC on 6/5/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit
import AVFoundation
extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
class CustomOverlayViewController: UIViewController {
    @IBOutlet weak var previewView: UIView!
    
    @IBOutlet weak var capturedImage: UIImageView!
    var flag = false
    var formatter  = [Any]()
    var defaultoverlay = true
    var customsoverlay = false
    var session: AVCaptureSession?
    var stillImageOutput: AVCaptureStillImageOutput?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private func updatePreviewLayer(layer: AVCaptureConnection, orientation: AVCaptureVideoOrientation) {
        
        layer.videoOrientation = orientation
        
        videoPreviewLayer?.frame = self.view.bounds
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      // capturedImage.roundedImage()
                // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func setting(_ sender: Any) {
        let str = self.storyboard?.instantiateViewController(withIdentifier: "dateformatt") as! dateformatt
        str.defaults = defaultoverlay
        str.customs = customsoverlay
         self.navigationController?.pushViewController(str, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        session = AVCaptureSession()
        session!.sessionPreset = AVCaptureSession.Preset.photo
        let backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back)
        var error: NSError?
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera!)
        } catch let error1 as NSError {
            error = error1
            input = nil
            print(error!.localizedDescription)
        }
        if error == nil && session!.canAddInput(input) {
            session!.addInput(input)
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
            if session!.canAddOutput(stillImageOutput!) {
                session!.addOutput(stillImageOutput!)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session!)
                videoPreviewLayer!.videoGravity = AVLayerVideoGravity.resizeAspect
                videoPreviewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                previewView.layer.addSublayer(videoPreviewLayer!)
                session!.startRunning()
                
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        videoPreviewLayer!.frame = previewView.bounds
    }
    @IBAction func btnTakePhoto(_ sender: AnyObject) {
        
        switch UIDevice.current.orientation{
        case .portrait:
            print("Portrait")
        case .portraitUpsideDown:
            print("up")

        case .landscapeLeft:
            print("land")

        case .landscapeRight:
            print("land")

        default:
            print("d")
        }
        
        let videoConnection = stillImageOutput!.connection(with: AVMediaType.video)
        if(videoConnection != nil) {
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection!, completionHandler: { (sampleBuffer, error) -> Void in
                if sampleBuffer != nil {
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer!)
                    let dataProvider = CGDataProvider(data: imageData as! CFData)
                    
                   
                    let cgImageRef = CGImage.init(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.relativeColorimetric)
                    
                    switch UIDevice.current.orientation{
                    case .portrait:
                        let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
                        let str = self.storyboard?.instantiateViewController(withIdentifier: "saveimg") as! saveimage
                        str.defaultsave = self.defaultoverlay
                        str.customsave = self.customsoverlay
                        if self.formatter.isEmpty {
                            let currentDateTime = Date()
                            
                            //  initialize the date formatter and set the style
                            let form = DateFormatter()
                            form.timeStyle = .medium
                            form.dateStyle = .long
                            form.dateFormat = "dd MMM yyyy hh:mma"
                            
                            // get the date time String from the date object
                            form.string(from: currentDateTime)
                            self.formatter.append("\(form.string(from: currentDateTime))")
                            str.aa = self.formatter
                        }else {
                            str.aa = self.formatter
                        }
                        self.flag = false
                        let img1 = UIImageView()
                        self.capturedImage.image = image
                        img1.image = self.capturedImage.image
                        str.img2.image = img1.image
                        str.flag1 = self.flag
                        //str.img.contentMode = .scaleToFill
                        //str.img.image = pickedImage
                        
                        self.navigationController?.pushViewController(str, animated: true)

                        print("Portrait")
                    
                        
                    case .landscapeLeft:
                        let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.up)
                        let str = self.storyboard?.instantiateViewController(withIdentifier: "saveimg") as! saveimage
                        str.defaultsave = self.defaultoverlay
                        str.customsave = self.customsoverlay
                        if self.formatter.isEmpty {
                            let currentDateTime = Date()
                            
                            //  initialize the date formatter and set the style
                            let form = DateFormatter()
                            form.timeStyle = .medium
                            form.dateStyle = .long
                            form.dateFormat = "dd MMM yyyy hh:mma"
                            
                            // get the date time String from the date object
                            form.string(from: currentDateTime)
                            self.formatter.append("\(form.string(from: currentDateTime))")
                            str.aa = self.formatter
                        }else {
                            str.aa = self.formatter
                        }
                        self.flag = false
                        let img1 = UIImageView()
                        self.capturedImage.image = image
                        img1.image = self.capturedImage.image
                        str.img2.image = img1.image
                        str.flag1 = self.flag
                        //str.img.contentMode = .scaleToFill
                        //str.img.image = pickedImage
                        
                        self.navigationController?.pushViewController(str, animated: true)

                        print("land")
                        
                    case .landscapeRight:
                        let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.down)
                        let str = self.storyboard?.instantiateViewController(withIdentifier: "saveimg") as! saveimage
                        str.defaultsave = self.defaultoverlay
                        str.customsave = self.customsoverlay
                        if self.formatter.isEmpty {
                            let currentDateTime = Date()
                            
                            //  initialize the date formatter and set the style
                            let form = DateFormatter()
                            form.timeStyle = .medium
                            form.dateStyle = .long
                            form.dateFormat = "dd MMM yyyy hh:mma"
                            
                            // get the date time String from the date object
                            form.string(from: currentDateTime)
                            self.formatter.append("\(form.string(from: currentDateTime))")
                            str.aa = self.formatter
                        }else {
                            str.aa = self.formatter
                        }
                        self.flag = false
                        let img1 = UIImageView()
                        self.capturedImage.image = image
                        img1.image = self.capturedImage.image
                        str.img2.image = img1.image
                        str.flag1 = self.flag
                        //str.img.contentMode = .scaleToFill
                        //str.img.image = pickedImage
                        
                        self.navigationController?.pushViewController(str, animated: true)

                        print("land")
                        
                    default:
                        let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
                        let str = self.storyboard?.instantiateViewController(withIdentifier: "saveimg") as! saveimage
                        str.defaultsave = self.defaultoverlay
                        str.customsave = self.customsoverlay
                        if self.formatter.isEmpty {
                            let currentDateTime = Date()
                            
                            //  initialize the date formatter and set the style
                            let form = DateFormatter()
                            form.timeStyle = .medium
                            form.dateStyle = .long
                            form.dateFormat = "dd MMM yyyy hh:mma"
                            
                            // get the date time String from the date object
                            form.string(from: currentDateTime)
                            self.formatter.append("\(form.string(from: currentDateTime))")
                            str.aa = self.formatter
                        }else {
                            str.aa = self.formatter
                        }
                        self.flag = false
                        let img1 = UIImageView()
                        self.capturedImage.image = image
                        img1.image = self.capturedImage.image
                        str.img2.image = img1.image
                        str.flag1 = self.flag
                        //str.img.contentMode = .scaleToFill
                        //str.img.image = pickedImage
                        
                        self.navigationController?.pushViewController(str, animated: true)

                        print("d")
                    }
                    
                    
                    
                }
            })
        }
    }

}
