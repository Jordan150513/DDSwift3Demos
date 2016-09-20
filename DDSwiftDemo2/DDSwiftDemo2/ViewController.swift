//
//  ViewController.swift
//  DDSwiftDemo2
//
//  Created by 乔丹丹 on 16/9/20.
//  Copyright © 2016年 Fang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.title = "Swift Demo2 - login"
        
        let backGroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        backGroundImageView.image = UIImage(named: "IOS背景图片")
        self.view.addSubview(backGroundImageView)
  
        let logoImageView = UIImageView(image: UIImage(named:"登录logo370x150"))
        backGroundImageView.addSubview(logoImageView)

        let top:NSLayoutConstraint = NSLayoutConstraint(item: logoImageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: backGroundImageView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 100)
        logoImageView.superview!.addConstraint(top)
        
        let leading:NSLayoutConstraint = NSLayoutConstraint(item: logoImageView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: backGroundImageView, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 50)
        logoImageView.superview!.addConstraint(leading)
        
        let trailing:NSLayoutConstraint = NSLayoutConstraint(item: logoImageView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: backGroundImageView, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: -50)
        logoImageView.superview!.addConstraint(trailing)
        //感觉没有起作用，怎么回事呢？
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

