//
//  ViewController.swift
//  button
//
//  Created by LuLinxuan on 25/12/14.
//  Copyright (c) 2014 LuLinxuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rotateBtn=ThreeBtnRotateOut()
    var popUpBtn=ThreeBtnPopUp()
    override func viewDidLoad() {
        super.viewDidLoad()
        var btn_0=UIButton()
        var btn_1=UIButton()
        var btn_2=UIButton()
        var btn_3=UIButton()
        btn_0.backgroundColor=UIColor.redColor()
        btn_1.backgroundColor=UIColor.grayColor()
        btn_2.backgroundColor=UIColor.blueColor()
        btn_3.backgroundColor=UIColor.blackColor()
     
       rotateBtn=ThreeBtnRotateOut(frame: CGRect(x: 200, y: 400, width: 30, height: 30), centerBtn: btn_0, button_1: btn_1, button_2: btn_2, button_3: btn_3, distance: 80,ViewController: self)
//        popUpBtn=ThreeBtnPopUp(frame: CGRect(x: 200, y: 400, width: 30, height: 30), centerBtn: btn_0, button_1: btn_1, button_2: btn_2, button_3: btn_3, distance: 80,ViewController: self)

        self.view.addSubview(rotateBtn)
//        self.view.addSubview(popUpBtn)
    }
    
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

