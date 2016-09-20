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
        //遗漏了这个
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFill
        backGroundImageView.addSubview(logoImageView)
        /*
        let top = NSLayoutConstraint(item: logoImageView, attribute: .top, relatedBy: .equal, toItem: backGroundImageView, attribute: .top, multiplier: 1.0, constant: 100)
        backGroundImageView.addConstraint(top)
        
        let leading = NSLayoutConstraint(item: logoImageView, attribute: .leading, relatedBy: .equal, toItem: backGroundImageView, attribute: .leading, multiplier: 1.0, constant: 100)
        backGroundImageView.addConstraint(leading)
        
        let trailing = NSLayoutConstraint(item: logoImageView, attribute: .trailing, relatedBy: .equal, toItem: backGroundImageView, attribute: .trailing, multiplier: 1.0, constant: -100)
        backGroundImageView.addConstraint(trailing)
        
        let height = NSLayoutConstraint(item: logoImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80)
        logoImageView.addConstraint(height)
        */
        //还可以用VLF语法布局－－－－－－－－
        let dict = ["logoImageView": logoImageView]
        let logoImageView_Constraint_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-100-[logoImageView]-100-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        let logoImageView_Constraint_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[logoImageView(\(80))]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        backGroundImageView.addConstraints(logoImageView_Constraint_V)
        backGroundImageView.addConstraints(logoImageView_Constraint_H)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

