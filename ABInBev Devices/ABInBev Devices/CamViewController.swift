//
//  CamViewController.swift
//  ABInBev Devices
//
//  Created by Fabio Leonardo Barros Martinez on 8/20/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit
import AVFoundation


class CamViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    @IBOutlet weak var viewPreview: UIView!
    
    var captureSession: AVCaptureSession!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.captureSession = nil
        startReading()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func btnBackAction(sender: AnyObject){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func startReading() {
        self.captureSession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: AVCaptureDevice.Position.front)
            else {
                print("Error")
                return
        }
        AVCaptureDevice.Position.front
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {
            print("Error ao iniciar camera")
            return
        }
        
        let captureMetadataOutput = AVCaptureMetadataOutput()
        if (self.captureSession.canAddOutput(captureMetadataOutput)) {
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            self.captureSession.addInput(input)
            self.captureSession.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession!)
        videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer.frame = viewPreview.layer.bounds
        viewPreview.layer.addSublayer(videoPreviewLayer)
        
        
        print(captureMetadataOutput.availableMetadataObjectTypes)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        self.captureSession.startRunning()
        
    }
    
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        self.captureSession = nil
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            print("Error")
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
            //            qrCodeFrameView?.frame = barCodeObject.bounds;
            
            if metadataObj.stringValue != nil {
                let ac = UIAlertController(title: "Device", message: metadataObj.stringValue, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                present(ac, animated: true)
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
