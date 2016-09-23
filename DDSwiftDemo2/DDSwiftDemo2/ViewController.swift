//
//  ViewController.swift
//  DDSwiftDemo2
//
//  Created by 乔丹丹 on 16/9/20.
//  Copyright © 2016年 Fang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var checkImageView : UIImageView!
    var usernameTextField : UITextField!
    var passwordTextField : UITextField!
    var usernamePasswordDict : NSMutableDictionary!
    var userNamesTableView : UITableView!
    
    
    
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
        usernameTextField = UITextField()
        usernameTextField.placeholder = "请输入用户名"
        //        usernameTextField.backgroundColor = UIColor.green
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.clearButtonMode = .whileEditing
        userNameBGView.addSubview(usernameTextField)
        let usernameTextField_leading = NSLayoutConstraint(item: usernameTextField, attribute: .leading, relatedBy: .equal, toItem: userNameIconimageV, attribute: .trailing, multiplier: 1.0, constant: 5)
        userNameBGView.addConstraint(usernameTextField_leading)
        let usernameTextField_top = NSLayoutConstraint(item: usernameTextField, attribute: .top, relatedBy: .equal, toItem: userNameBGView, attribute: .top, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(usernameTextField_top)
        let usernameTextField_bottom = NSLayoutConstraint(item: usernameTextField, attribute: .bottom, relatedBy: .equal, toItem: userNameBGView, attribute: .bottom, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(usernameTextField_bottom)
        let usernameTextField_trailing = NSLayoutConstraint(item: usernameTextField, attribute: .trailing, relatedBy: .equal, toItem: userNameBGView, attribute: .trailing, multiplier: 1.0, constant: -30)
        backGroundImageView.addConstraint(usernameTextField_trailing)
        
//        //用户名下拉三角
//        let arrowImageView = UIImageView(image: UIImage(named: "arrow_shu"))
//        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
//        arrowImageView.isUserInteractionEnabled = true
//        arrowImageView.contentMode = .scaleAspectFit
//        userNameBGView.addSubview(arrowImageView)
//        let arrowImageView_leading = NSLayoutConstraint(item: arrowImageView, attribute: .leading, relatedBy: .equal, toItem: usernameTextField, attribute: .trailing, multiplier: 1.0, constant: 10)
//        userNameBGView.addConstraint(arrowImageView_leading)
//        
//        let arrowImageView_top = NSLayoutConstraint(item: arrowImageView, attribute: .top, relatedBy: .equal, toItem: userNameBGView, attribute: .top, multiplier: 1.0, constant: 17)
//        backGroundImageView.addConstraint(arrowImageView_top)
//        
//        let arrowImageView_trailing = NSLayoutConstraint(item: arrowImageView, attribute: .trailing, relatedBy: .equal, toItem: userNameBGView, attribute: .trailing, multiplier: 1.0, constant: -10)
//        backGroundImageView.addConstraint(arrowImageView_trailing)
//        
//        let arrowImageView_bottom = NSLayoutConstraint(item: arrowImageView, attribute: .bottom, relatedBy: .equal, toItem: userNameBGView, attribute: .bottom, multiplier: 1.0, constant: -17)
//        backGroundImageView.addConstraint(arrowImageView_bottom)
        
        //用户名下拉三角Btn
        let arrowBtn = UIButton(type: .custom)
        arrowBtn.setImage(UIImage(named: "arrow_shu"), for: .normal)
        arrowBtn.imageView?.contentMode = .scaleAspectFit
        userNameBGView.addSubview(arrowBtn)
        //总是忘记这个，不加上这个就不会出现布局效果
        arrowBtn.translatesAutoresizingMaskIntoConstraints = false
        let arrowBtn_leading = NSLayoutConstraint(item: arrowBtn, attribute: .leading, relatedBy: .equal, toItem: usernameTextField, attribute: .trailing, multiplier: 1.0, constant: 0)
        userNameBGView.addConstraint(arrowBtn_leading)
        
        let arrowBtn_top = NSLayoutConstraint(item: arrowBtn, attribute: .top, relatedBy: .equal, toItem: userNameBGView, attribute: .top, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(arrowBtn_top)
        
        let arrowBtn_trailing = NSLayoutConstraint(item: arrowBtn, attribute: .trailing, relatedBy: .equal, toItem: userNameBGView, attribute: .trailing, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(arrowBtn_trailing)
        
        let arrowBtn_bottom = NSLayoutConstraint(item: arrowBtn, attribute: .bottom, relatedBy: .equal, toItem: userNameBGView, attribute: .bottom, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(arrowBtn_bottom)
        arrowBtn.addTarget(self, action: #selector(ViewController.arrowBtnClicked), for: UIControlEvents.touchUpInside)
        
        //密码输入textfield
        passwordTextField = UITextField()
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
        let passwordTextField_trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: passwordBGView, attribute: .trailing, multiplier: 1.0, constant: -30)
        backGroundImageView.addConstraint(passwordTextField_trailing)
        
        //登陆按钮
        let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.backgroundColor = UIColor.blue
        loginBtn.layer.cornerRadius = 20
        loginBtn.layer.masksToBounds = true
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        backGroundImageView.addSubview(loginBtn)
        
        let loginBtn_leading = NSLayoutConstraint(item: loginBtn, attribute: .leading, relatedBy: .equal, toItem: backGroundImageView, attribute: .leading, multiplier: 1.0, constant: 30)
        self.view.addConstraint(loginBtn_leading)
        
        let loginBtn_top = NSLayoutConstraint(item: loginBtn, attribute: .top, relatedBy: .equal, toItem: passwordBGView, attribute: .bottom, multiplier: 1.0, constant: 60)
        self.view.addConstraint(loginBtn_top)
        
        let loginBtn_trailing = NSLayoutConstraint(item: loginBtn, attribute: .trailing, relatedBy: .equal, toItem: backGroundImageView, attribute: .trailing, multiplier: 1.0, constant: -30)
        self.view.addConstraint(loginBtn_trailing)
        
        let loginBtn_height = NSLayoutConstraint(item: loginBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        loginBtn.addConstraint(loginBtn_height)
        
        loginBtn.addTarget(self, action: #selector(ViewController.loginBtnClicked), for: .touchUpInside)
        
        //记住密码按钮
        let rememberPasswordBtn = UIButton(type: .custom)
        rememberPasswordBtn.setTitle("记住密码", for: .normal)
        rememberPasswordBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        rememberPasswordBtn.translatesAutoresizingMaskIntoConstraints = false
        rememberPasswordBtn.titleLabel?.textAlignment = .left
        backGroundImageView.addSubview(rememberPasswordBtn)
        let rememberPasswordBtn_top = NSLayoutConstraint(item: rememberPasswordBtn, attribute: .top, relatedBy: .equal, toItem: passwordBGView, attribute: .bottom, multiplier: 1.0, constant: 10)
        backGroundImageView.addConstraint(rememberPasswordBtn_top)
        let rememberPasswordBtn_trailing = NSLayoutConstraint(item: rememberPasswordBtn, attribute: .trailing, relatedBy: .equal, toItem: passwordBGView, attribute: .trailing, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(rememberPasswordBtn_trailing)
        let rememberPasswordBtn_height = NSLayoutConstraint(item: rememberPasswordBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        rememberPasswordBtn.addConstraint(rememberPasswordBtn_height)
        rememberPasswordBtn.addTarget(self, action: #selector(ViewController.rememberBtnClicked), for: .touchUpInside)
        
        let rememberBoxBtn = UIButton(type: .custom)
        rememberBoxBtn.setImage(UIImage(named: "记住密码9603.9.0"), for: .normal)
        rememberBoxBtn.translatesAutoresizingMaskIntoConstraints = false
        rememberBoxBtn.imageView?.contentMode = .scaleAspectFit
        rememberBoxBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        rememberBoxBtn.layoutIfNeeded()
        backGroundImageView.addSubview(rememberBoxBtn)
        
        let rememberBoxBtn_top = NSLayoutConstraint(item: rememberBoxBtn, attribute: .top, relatedBy: .equal, toItem: rememberPasswordBtn, attribute: .top, multiplier: 1.0, constant: 10)
        backGroundImageView.addConstraint(rememberBoxBtn_top)
        
        let rememberBoxBtn_trailing = NSLayoutConstraint(item: rememberBoxBtn, attribute: .trailing, relatedBy: .equal, toItem: rememberPasswordBtn, attribute: .leading, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(rememberBoxBtn_trailing)
        
        let rememberBoxBtn_height = NSLayoutConstraint(item: rememberBoxBtn, attribute: .height, relatedBy: .equal, toItem: rememberPasswordBtn, attribute: .height, multiplier: 1.0, constant: -20)
        backGroundImageView.addConstraint(rememberBoxBtn_height)
        
        let rememberBoxBtn_width = NSLayoutConstraint(item: rememberBoxBtn, attribute: .width, relatedBy: .equal, toItem: rememberBoxBtn, attribute: .height, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(rememberBoxBtn_width)
        
//        rememberBoxBtn.addTarget(self, action: #selector(ViewController.rememberBtnClicked), for: .touchUpInside)
       
        checkImageView = UIImageView(image: UIImage(named: "对勾9603.9.0"))
        checkImageView.contentMode = .scaleAspectFit
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkImageView.backgroundColor = UIColor.clear
        rememberBoxBtn.addSubview(checkImageView)
        
        let checkImageView_leading = NSLayoutConstraint(item: checkImageView, attribute: .leading, relatedBy: .equal, toItem: rememberBoxBtn, attribute: .leading, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(checkImageView_leading)
        
        let checkImageView_top = NSLayoutConstraint(item: checkImageView, attribute: .top, relatedBy: .equal, toItem: rememberBoxBtn, attribute: .top, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(checkImageView_top)
        
        let checkImageView_trailing = NSLayoutConstraint(item: checkImageView, attribute: .trailing, relatedBy: .equal, toItem: rememberBoxBtn, attribute: .trailing, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(checkImageView_trailing)
        
        let checkImageView_bottom = NSLayoutConstraint(item: checkImageView, attribute: .bottom, relatedBy: .equal, toItem: rememberBoxBtn, attribute: .bottom, multiplier: 1.0, constant: 0)
        backGroundImageView.addConstraint(checkImageView_bottom)
        checkImageView.isHidden = true
        
        //用户名的tableView下拉tableView
        userNamesTableView = UITableView(frame: CGRect.zero, style: .plain)
        userNamesTableView.translatesAutoresizingMaskIntoConstraints = false
        backGroundImageView.addSubview(userNamesTableView)
        userNamesTableView.delegate = self
        userNamesTableView.dataSource = self
    }
    //table的数据源
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
    //tableView代理方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    //记住按钮的点击事件
    func rememberBtnClicked() {
        checkImageView.isHidden = !checkImageView.isHidden
    }
    //登录按钮的点击事件
    func loginBtnClicked() {
        if (usernameTextField.text?.isEmpty)!||usernameTextField.text==nil {
            print("请输入用户名")
        }else if (passwordTextField.text?.isEmpty)!||passwordTextField.text == nil{
            print("请输入密码")
        }else{
            loginAndRemeberUsers()
        }
    }
    
    //进行登陆操作和记住密码
    func loginAndRemeberUsers() {
        if !checkImageView.isHidden {
            //需要记住密码
            usernamePasswordDict = NSMutableDictionary(capacity: 10)
            usernamePasswordDict.setValue(passwordTextField.text, forKey: usernameTextField.text!)
        }

    }
    //用户名下拉箭头按钮的点击事件
    func arrowBtnClicked() {
        if usernamePasswordDict.count>0 {
            //让用户名的tableview显示出来
            
        }
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

