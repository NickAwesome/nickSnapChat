//
//  MasterViewController.swift
//  nickSnapChat
//
//  Created by User on 6/8/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import LBTAComponents

class MasterViewController: UIViewController, UIScrollViewDelegate {
    
    let controllerList: [UIViewController] = {
//        "chatController": UINavigationController(rootViewController: ChatController()),
//        "cameraController": UINavigationController(rootViewController: CameraController()),
//        "storyController": UINavigationController(rootViewController: StoryController()),
        
        let chatController = UINavigationController(rootViewController: ChatController())
        let cameraController = UINavigationController(rootViewController: CameraController())
        let storyController = UINavigationController(rootViewController: StoryController())
        
        return [chatController, cameraController, storyController]
    }()
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.isPagingEnabled = true
        sv.delegate = self
        //sv.contentOffset.x = self.view.frame.width
        return sv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        pc.currentPageIndicatorTintColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
        pc.numberOfPages = self.controllerList.count
        pc.currentPage = 1
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        scrollView.fillSuperview()
        pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 40)
        
        setupScrollView()
    }
    
    fileprivate func setupScrollView() {
        
        let chatController = controllerList.first!
        let cameraController = controllerList[1]
        let storyController = controllerList.last!
        
        self.addChildViewController(chatController)
        self.scrollView.addSubview(chatController.view)
        chatController.didMove(toParentViewController: self)
        chatController.view.frame = scrollView.bounds
    
        self.addChildViewController(cameraController)
        self.scrollView.addSubview(cameraController.view)
        cameraController.didMove(toParentViewController: self)
        cameraController.view.frame = scrollView.bounds
    
        self.addChildViewController(storyController)
        self.scrollView.addSubview(storyController.view)
        storyController.didMove(toParentViewController: self)
        storyController.view.frame = scrollView.bounds
    
        var cameraControllerFrame: CGRect = cameraController.view.frame
        cameraControllerFrame.origin.x = self.view.frame.width
        cameraController.view.frame = cameraControllerFrame
        
        var storyControllerFrame: CGRect = storyController.view.frame
        storyControllerFrame.origin.x =  2 * self.view.frame.width
        storyController.view.frame = storyControllerFrame
    
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: view.frame.size.height)
        self.scrollView.contentOffset = CGPoint(x: self.view.frame.width * 1, y: self.view.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

//class MasterViewController: UIPageViewController, UIPageViewControllerDataSource {
//    
//    let controllerList: [UIViewController] = {
//        let chatController = UINavigationController(rootViewController: ChatController())
//        let cameraController = UINavigationController(rootViewController: CameraController())
//        let storyController = UINavigationController(rootViewController: StoryController())
//        
//        return [chatController, cameraController, storyController]
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        dataSource = self
//        
//        if controllerList.first != nil {
//            setViewControllers([controllerList[1]], direction: .forward, animated: true, completion: nil)
//        }
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        for view in self.view.subviews {
//            if view is UIScrollView {
//                view.frame = UIScreen.main.bounds
//            } else if view is UIPageControl {
//                view.backgroundColor = UIColor.clear
//            }
//        }
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let controllerListIndex = controllerList.index(of: viewController) else { return nil }
//        let previousIndex = controllerListIndex - 1
//        
//        guard previousIndex >= 0 else { return nil }
//        guard controllerList.count > previousIndex else {return nil }
//        
//        return controllerList[previousIndex]
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let controllerListIndex = controllerList.index(of: viewController) else { return nil }
//        let nextIndex = controllerListIndex + 1
//        
//        guard controllerList.count != nextIndex else {return nil }
//        guard controllerList.count > nextIndex else { return nil }
//        
//        return controllerList[nextIndex]
//    }
//    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return controllerList.count
//    }
//    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = controllerList.index(of: firstViewController) else {
//            return 0
//        }
//        
//        return firstViewControllerIndex
//    }
//}

//class MasterViewController: UIViewController {
//    
//    let toChatButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("To Chat View", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
//        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
//        button.addTarget(self, action: #selector(handleToChat), for: .touchUpInside)
//        return button
//    }()
//    
//    let toCameraButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("To Camera View", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
//        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
//        button.addTarget(self, action: #selector(handleToCamera), for: .touchUpInside)
//        return button
//    }()
//    
//    let toStoryButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("To Story View", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
//        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
//        button.addTarget(self, action: #selector(handleToStory), for: .touchUpInside)
//        return button
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        edgesForExtendedLayout = []
//        
//        view.addSubview(toChatButton)
//        view.addSubview(toCameraButton)
//        view.addSubview(toStoryButton)
//        
//        toChatButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: view.frame.width, heightConstant: 50)
//        toCameraButton.anchor(toChatButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: view.frame.width, heightConstant: 50)
//        toStoryButton.anchor(toCameraButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 12, bottomConstant: 0, rightConstant: 12, widthConstant: view.frame.width, heightConstant: 50)
//    }
//    
//    func handleToChat() {
//        let chatController = ChatController()
//        let navController = UINavigationController(rootViewController: chatController)
//        present(navController, animated: true, completion: nil)
//    }
//    
//    func handleToCamera() {
//        let cameraController = CameraController()
//        let navController = UINavigationController(rootViewController: cameraController)
//        present(navController, animated: true, completion: nil)
//    }
//    
//    func handleToStory() {
//        let storyController = StoryController()
//        let navController = UINavigationController(rootViewController: storyController)
//        present(navController, animated: true, completion: nil)
//    }
//}
