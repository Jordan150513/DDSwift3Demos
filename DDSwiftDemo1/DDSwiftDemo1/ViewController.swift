//
//  ViewController.swift
//  DDSwiftDemo1
//
//  Created by 乔丹丹 on 16/9/20.
//  Copyright © 2016年 Fang. All rights reserved.
//

import UIKit

var numberLabel:UILabel!
var countBtn:UIButton!
var resetBtn : UIButton!


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift Demo 1 - count"
        
        numberLabel = UILabel(frame:CGRect(x:0 , y: 100, width: UIScreen.main.bounds.size.width, height: 40))
        numberLabel.text = "0"
        numberLabel.font = UIFont.systemFont(ofSize: 18)
//        numberLabel.textAlignment = NSTextAlignment(rawValue: 1)!
        numberLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(numberLabel)
        
        countBtn = UIButton(type:UIButtonType.custom)
        countBtn.frame = CGRect(x: 100, y: 200, width: 80, height: 40)
        countBtn.setTitle("Count", for: UIControlState.normal)
        countBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        countBtn.target(forAction: #selector(ViewController.tapToCount), withSender: nil)
        countBtn.addTarget(self, action: #selector(ViewController.tapToCount), for: UIControlEvents.touchUpInside)
        countBtn.backgroundColor = UIColor.blue
        self.view.addSubview(countBtn)
        
        resetBtn = UIButton(type: UIButtonType.custom)
        resetBtn.frame = CGRect(x: 200, y: 200, width: 80, height: 40)
        resetBtn.setTitle("Reset", for: UIControlState.normal)
        resetBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        resetBtn.addTarget(self, action: #selector(ViewController.tapToReset), for: UIControlEvents.touchUpInside)
        resetBtn.backgroundColor = UIColor.blue
        self.view.addSubview(resetBtn)
    }
    //重置按钮的点击事件
    func tapToReset() {
        numberLabel.text = "0"
    }
    //Count按钮的点击事件
    func tapToCount() {
        let countStr = numberLabel.text
        var count:NSInteger = NSInteger(countStr!)!
        count += 1
        numberLabel.text = String(count)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

