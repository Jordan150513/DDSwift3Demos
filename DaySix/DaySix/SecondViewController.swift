//
//  SecondViewController.swift
//  DaySix
//
//  Created by 乔丹丹 on 16/8/10.
//  Copyright © 2016年 Jordan. All rights reserved.
// A-->B B-->A传值练习

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var dataStr:String?
    
    typealias CompleteColsure = (string: String) ->Void
    var complete: CompleteColsure?
    func initWithAClosure(complete: CompleteColsure?) {
        self.complete = complete
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentLabel.text = dataStr
//        contentLabel.text = dataStr
    }
    
    @IBAction func backToPreBtnClicked(_ sender: AnyObject) {
        self.dismiss(animated: true) { 
            self.complete?(string: self.textField.text!)
        };
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
