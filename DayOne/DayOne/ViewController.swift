//
//  ViewController.swift
//  DayOne
//
//  Created by 乔丹丹 on 16/8/4.
//  Copyright © 2016年 Fang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapBtnClicked(_ sender: AnyObject) {
        let tmpNumber = NSInteger(countLabel.text!)!+1
        countLabel.text = String(tmpNumber)
    }
    @IBAction func resetBtnClicked(_ sender: AnyObject) {
        countLabel.text = "0"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

