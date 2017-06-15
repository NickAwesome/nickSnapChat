//
//  CameraViewController.swift
//  nickSnapChat
//
//  Created by User on 6/8/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import AVFoundation
import LBTAComponents

class CameraController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
    }
}

//let scrollView = UIScrollView(frame: view.bounds)
//scrollView.pagingEnabled = true
//view.addSubview(scrollView)
//
//let pageSize = view.bounds.size
//
//let upperView = UIView()
//upperView.backgroundColor = UIColor.redColor()
//
//let lowerView = UITableView()
//lowerView.backgroundColor = UIColor.blueColor()
//
//let pagesViews = [upperView , lowerView]
//
//let numberOfPages = pagesViews.count
//
//for (pageIndex,page) in pagesViews.enumerate(){
//    page.frame = CGRect(origin: CGPoint(x:0 , y:CGFloat(pageIndex) * pageSize.height), size: pageSize)
//    scrollView.addSubview(page)
//}
//
//scrollView.contentSize = CGSize(width: pageSize.width, height: pageSize.height * CGFloat(numberOfPages))

//var captureSession: AVCaptureSession?
//var videoPreviewLayer: AVCaptureVideoPreviewLayer?

//        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
//
//        do {
//            let input = try AVCaptureDeviceInput(device: captureDevice)
//            captureSession = AVCaptureSession()
//            captureSession?.addInput(input)
//
//            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
//            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
//            videoPreviewLayer?.frame = view.layer.bounds
//            view.layer.addSublayer(videoPreviewLayer!)
//
//            captureSession?.startRunning()
//        } catch {
//            print(error)
//            return
//        }
