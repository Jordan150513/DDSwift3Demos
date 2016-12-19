//
//  ViewController.swift
//  DayThree
//
//  Created by 乔丹丹 on 16/8/8.
//  Copyright © 2016年 Jordan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tipNameLabel: UILabel!
    @IBOutlet weak var topField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topField.delegate = self
//        topField.keyboardType = UIKeyboardTypeNumberPad 
        //#######这里有个坑
    }

    @IBAction func leftDoneBtnClicked(_ sender: AnyObject) {
     self.view.endEditing(true)
    }
    
    @IBAction func sliderChanged(_ sender: AnyObject) {
     print("slider value changed.")
        if topField.text==nil||topField.text=="" {
            print("请输入本金")
            return
        }else{
            let result = Float(topField.text!)!*slider.value
            tipNameLabel.text = "Tip％"+String((slider?.value)!*100)+":"//Tip％15:
            tipLabel.text = String(result)
            totalLabel.text = String(result + Float(topField.text!)!)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       print(textField.text)
        if topField.text==nil||topField.text=="" {
            print("请输入本金")
            return
        }else{
            let result = Float(textField.text!)!*slider.value
            tipLabel.text = String(result)
            totalLabel.text = String(result + Float(textField.text!)!)

        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

