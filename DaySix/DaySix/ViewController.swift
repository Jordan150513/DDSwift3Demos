//
//  ViewController.swift
//  DaySix
//
//  Created by 乔丹丹 on 16/8/10.
//  Copyright © 2016年 Jordan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self
    }
    
    @IBAction func nextBtnClicked(_ sender: AnyObject) {
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func changeContentLabelTextTakeAClosure(string: String) ->Void {
        DispatchQueue.main.async {
            self.contentLabel.text = string;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        let secondVC = segue.destinationViewController as! SecondViewController
        secondVC.dataStr = textField.text
        secondVC.initWithAClosure(complete: changeContentLabelTextTakeAClosure)
//        secondVC.contentLabel.text = textField.text
        
        //------------------这里有一个知识点，属性的访问权限的问题-----原demo附说明链接----------------//
        /**
         下面的dataStr默认是internal
         一篇关于public internal private的文章  写的很详细
         Swift新特性 — 访问控制（Access Control）
         http://www.devtalking.com/articles/swift-access-control/
         以上感谢<程序员说>提供的文章
         */
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

