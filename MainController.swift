//
//  MainViewController.swift
//  nickSnapChat
//
//  Created by User on 6/8/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import LBTAComponents

class MainController: UIViewController {

    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: self.view.bounds)
        sv.isPagingEnabled = true
        sv.contentOffset.y = self.view.frame.height
        return sv
    }()
    
    var cameraController = CameraController()
    var memoryController = MemoryController()
    var menuController = MenuController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: view.frame.height)
        
        setupScrollView()
    }
    
    fileprivate func setupScrollView() {
        
        self.addChildViewController(menuController)
        self.scrollView.addSubview(menuController.view)
        menuController.didMove(toParentViewController: self)
        
        self.addChildViewController(cameraController)
        self.scrollView.addSubview(cameraController.view)
        cameraController.didMove(toParentViewController: self)
        
        self.addChildViewController(memoryController)
        self.scrollView.addSubview(memoryController.view)
        memoryController.didMove(toParentViewController: self)
        
        var menuControllerFrame: CGRect = menuController.view.frame
        menuControllerFrame.origin.y = menuControllerFrame.height
        cameraController.view.frame = menuControllerFrame
        
        var cameraControllerFrame: CGRect = cameraController.view.frame
        cameraControllerFrame.origin.y = 2 * cameraControllerFrame.height
        memoryController.view.frame = cameraControllerFrame
        
        self.scrollView.contentSize = CGSize(width: view.frame.size.width, height: self.view.frame.height * 3)
    }
}















