//
//  ViewControllerTwo.swift
//  DaySeven
//
//  Created by 乔丹丹 on 16/8/11.
//  Copyright © 2016年 Jordan. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createLeftNavItem()
        self.createDownGest()
    }
    func createLeftNavItem() {
        let leftBtn = UIButton(frame: CGRect(x:0,y:0,width:25,height:25))
//        leftBtn.setBackgroundImage(UIImage(named: ""), for:U)
        leftBtn.setBackgroundImage(UIImage(named: "navigation_back_button"), for:[])
        leftBtn.addTarget(self, action: #selector(ViewControllerTwo.Toback), for: UIControlEvents.touchUpInside)
        let leftItem = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftItem        
        
    }
    func createDownGest() {
        let swipGet = UISwipeGestureRecognizer.init(target: self, action: #selector(ViewControllerTwo.swipToDown))
       swipGet.direction = .down
        view.addGestureRecognizer(swipGet)
    }
    func swipToDown() {
        self.view.endEditing(true)
    }
    func Toback() {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
