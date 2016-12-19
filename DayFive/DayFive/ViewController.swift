//
//  ViewController.swift
//  DayFive
//
//  Created by 乔丹丹 on 16/8/10.
//  Copyright © 2016年 Jordan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateDateTime()
    }

    @IBAction func refreshBtnClicked(_ sender: AnyObject) {
        self.updateDateTime()
    }
    func updateDateTime() {
        let dateformat = DateFormatter()
//        dateformat.dateStyle = DateFormatter.Style.kCFDateFormatterLongStyle
//        dateformat.timeStyle = DateFormatter.Style.kCFDateFormatterMediumStyle
        dateformat.dateStyle = DateFormatter.Style.longStyle
        dateformat.timeStyle = DateFormatter.Style.mediumStyle
//        dateformat.dateStyle = "yyyy-MM-dd a HH:mm:ss"
//        dateformat.timeStyle =
//----------------注意swift3的语法变化，枚举的变化，命名的精简变化---------------//
        dateTimeLabel.text = dateformat.string(from: Date())
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

