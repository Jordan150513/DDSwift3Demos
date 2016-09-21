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
        //创建UI
        createUI()
    }
    
    //创建UI
    func createUI() {
        //背景图片
        let backGroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        backGroundImageView.image = UIImage(named: "IOS背景图片")
        backGroundImageView.isUserInteractionEnabled = true
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
        
        //还可以用VFL（Visual Format Language）语法布局－－－－－－－－
        let dict = ["logoImageView": logoImageView]
        let logoImageView_Constraint_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-100-[logoImageView]-100-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        let logoImageView_Constraint_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[logoImageView(\(80))]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict)
        backGroundImageView.addConstraints(logoImageView_Constraint_V)
        backGroundImageView.addConstraints(logoImageView_Constraint_H)
        
        //用户名输入框背景
        let userNameBGView = UIView()
        userNameBGView.backgroundColor = UIColor.white
        userNameBGView.layer.cornerRadius = 3
        userNameBGView.layer.masksToBounds = true
        userNameBGView.isUserInteractionEnabled = true
        userNameBGView.translatesAutoresizingMaskIntoConstraints = false
        backGroundImageView.addSubview(userNameBGView)
        
        let userNameBGView_leading = NSLayoutConstraint(item: userNameBGView, attribute: .leading, relatedBy: .equal, toItem: backGroundImageView, attribute: .leading, multiplier: 1.0, constant: 40)
        backGroundImageView.addConstraint(userNameBGView_leading)
        
        let userNameBGView_top = NSLayoutConstraint(item: userNameBGView, attribute: .top, relatedBy: .equal, toItem: logoImageView, attribute: .bottom, multiplier: 1.0, constant: 30)
        backGroundImageView.addConstraint(userNameBGView_top)
        
        let userNameBGView_trailing = NSLayoutConstraint(item: userNameBGView, attribute: .trailing, relatedBy: .equal, toItem: backGroundImageView, attribute: .trailing, multiplier: 1.0, constant: -40)
        backGroundImageView.addConstraint(userNameBGView_trailing)
        
        let userNameBGView_height = NSLayoutConstraint(item: userNameBGView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        userNameBGView.addConstraint(userNameBGView_height)
        
        //密码框输入背景
        let passwordBGView = UIView()
        passwordBGView.backgroundColor = UIColor.white
        passwordBGView.layer.cornerRadius = 3
        passwordBGView.layer.masksToBounds = true
        passwordBGView.isUserInteractionEnabled = true
        passwordBGView.translatesAutoresizingMaskIntoConstraints = false
        backGroundImageView.addSubview(passwordBGView)
        
        let passwordBGView_leading = NSLayoutConstraint(item: passwordBGView, attribute: .leading, relatedBy: .equal, toItem: backGroundImageView, attribute: .leading, multiplier: 1.0, constant: 40)
        backGroundImageView.addConstraint(passwordBGView_leading)
        
        let passwordBGView_top = NSLayoutConstraint(item: passwordBGView, attribute: .top, relatedBy: .equal, toItem: userNameBGView, attribute: .bottom, multiplier: 1.0, constant: 20)
        backGroundImageView.addConstraint(passwordBGView_top)
        
        let passwordBGView_trailing = NSLayoutConstraint(item: passwordBGView, attribute: .trailing, relatedBy: .equal, toItem: backGroundImageView, attribute: .trailing, multiplier: 1.0, constant: -40)
        backGroundImageView.addConstraint(passwordBGView_trailing)
        
        let passwordBGView_height = NSLayoutConstraint(item: passwordBGView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        passwordBGView.addConstraint(passwordBGView_height)
        
        //用户名icon
        let userNameIconimageV = UIImageView(image: UIImage(named: "IOS用户图标"))
        userNameIconimageV.contentMode = .scaleAspectFit
        userNameBGView.addSubview(userNameIconimageV)
        userNameIconimageV.translatesAutoresizingMaskIntoConstraints = false
        userNameBGView.addSubview(userNameIconimageV)
        
        let userNameIconimageV_leading = NSLayoutConstraint(item: userNameIconimageV, attribute: .leading, relatedBy: .equal, toItem: userNameBGView, attribute: .leading, multiplier: 1.0, constant: 5)
        backGroundImageView.addConstraint(userNameIconimageV_leading)
        
        let userNameIconimageV_top = NSLayoutConstraint(item: userNameIconimageV, attribute: .top, relatedBy: .equal, toItem: userNameBGView, attribute: .top, multiplier: 1.0, constant: 12)
        backGroundImageView.addConstraint(userNameIconimageV_top)
        
        let userNameIconimageV_bottom = NSLayoutConstraint(item: userNameIconimageV, attribute: .bottom, relatedBy: .equal, toItem: userNameBGView, attribute: .bottom, multiplier: 1.0, constant: -12)
        backGroundImageView.addConstraint(userNameIconimageV_bottom)
        
        let userNameIconimageV_width = NSLayoutConstraint(item: userNameIconimageV, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 14)
        backGroundImageView.addConstraint(userNameIconimageV_width)
        
        //密码icon
        let passwordIconimageV = UIImageView(image: UIImage(named: "密码锁"))
        passwordIconimageV.contentMode = .scaleAspectFit
        passwordBGView.addSubview(passwordIconimageV)
        passwordIconimageV.translatesAutoresizingMaskIntoConstraints = false
        passwordBGView.addSubview(passwordIconimageV)
        
        let passwordIconimageV_leading = NSLayoutConstraint(item: passwordIconimageV, attribute: .leading, relatedBy: .equal, toItem: passwordBGView, attribute: .leading, multiplier: 1.0, constant: 5)
        backGroundImageView.addConstraint(passwordIconimageV_leading)
        
        let passwordIconimageV_top = NSLayoutConstraint(item: passwordIconimageV, attribute: .top, relatedBy: .equal, toItem: passwordBGView, attribute: .top, multiplier: 1.0, constant: 12)
        backGroundImageView.addConstraint(passwordIconimageV_top)
        
        let passwordIconimageV_bottom = NSLayoutConstraint(item: passwordIconimageV, attribute: .bottom, relatedBy: .equal, toItem: passwordBGView, attribute: .bottom, multiplier: 1.0, constant: -12)
        backGroundImageView.addConstraint(passwordIconimageV_bottom)
        
        let passwordIconimageV_width = NSLayoutConstraint(item: passwordIconimageV, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 14)
        backGroundImageView.addConstraint(passwordIconimageV_width)
        
        //用户名输入textfield
        let usernameTextField = UITextField()
        usernameTextField.placeholder = "请输入用户名"
        //        usernameTextField.backgroundColor = UIColor.green
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameBGView.addSubview(usernameTextField)
        let usernameTextField_leading = NSLayoutConstraint(item: usernameTextField, attribute: .leading, relatedBy: .equal, toItem: userNameIconimageV, attribute: .trailing, multiplier: 1.0, constant: 5)
        userNameBGView.addConstraint(usernameTextField_leading)
        let usernameTextField_top = NSLayoutConstraint(item: usernameTextField, attribute: .top, relatedBy: .equal, toItem: userNameBGView, attribute: .top, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(usernameTextField_top)
        let usernameTextField_bottom = NSLayoutConstraint(item: usernameTextField, attribute: .bottom, relatedBy: .equal, toItem: userNameBGView, attribute: .bottom, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(usernameTextField_bottom)
        let usernameTextField_trailing = NSLayoutConstraint(item: usernameTextField, attribute: .trailing, relatedBy: .equal, toItem: userNameBGView, attribute: .trailing, multiplier: 1.0, constant: -40)
        backGroundImageView.addConstraint(usernameTextField_trailing)
        
        //密码输入textfield
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "请输入密码"
        //        passwordTextField.backgroundColor = UIColor.green
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordBGView.addSubview(passwordTextField)
        let passwordTextField_leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: passwordIconimageV, attribute: .trailing, multiplier: 1.0, constant: 5)
        passwordBGView.addConstraint(passwordTextField_leading)
        let passwordTextField_top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: passwordBGView, attribute: .top, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(passwordTextField_top)
        let passwordTextField_bottom = NSLayoutConstraint(item: passwordTextField, attribute: .bottom, relatedBy: .equal, toItem: passwordBGView, attribute: .bottom, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(passwordTextField_bottom)
        let passwordTextField_trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: passwordBGView, attribute: .trailing, multiplier: 1.0, constant: -40)
        backGroundImageView.addConstraint(passwordTextField_trailing)
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

