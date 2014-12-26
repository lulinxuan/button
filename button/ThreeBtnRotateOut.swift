//
//  ThreeBtnRotateOut.swift
//  button
//
//  Created by LuLinxuan on 25/12/14.
//  Copyright (c) 2014 LuLinxuan. All rights reserved.
//

import UIKit

class ThreeBtnRotateOut: UIView {
    
    var btn=UIButton()
    var btn_1=UIButton()
    var btn_2=UIButton()
    var btn_3=UIButton()
    var btnOpen=false
    var transfer=false
    var l=CGFloat(120)
    var controller=UIViewController()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init() {
        super.init(frame: CGRect(x: 0,y: 0,width: 0,height: 0))
    }
    
    //Set all the property of the four buttons first like image, action ect.By default the three button will pop up to the upper left, if you want to change it to other direction,change by your self. the distance stands for how long to buttons will pop up tp.
    init(frame: CGRect,centerBtn:UIButton,button_1:UIButton,button_2:UIButton,button_3:UIButton,distance:CGFloat=120,ViewController:UIViewController) {
        super.init(frame: frame)
        var btnSize=frame.size
        self.l=distance
        self.controller=ViewController
        self.backgroundColor=UIColor.clearColor()
        self.btn=centerBtn
        self.btn_1=button_1
        self.btn_2=button_2
        self.btn_3=button_3
        btn.frame=CGRect(origin: CGPoint(x: 0, y: 0), size: btnSize)
        btn_1.frame=frame
        btn_2.frame=frame
        btn_3.frame=frame
        btn_1.autoresizesSubviews=false
        btn_2.autoresizesSubviews=false
        btn_3.autoresizesSubviews=false
        btn.addTarget(self, action: Selector("tap:"), forControlEvents: UIControlEvents.TouchUpInside)
        btn_1.addTarget(self, action: Selector("tap:"), forControlEvents: UIControlEvents.TouchUpInside)
        btn_2.addTarget(self, action: Selector("tap:"), forControlEvents: UIControlEvents.TouchUpInside)
        btn_3.addTarget(self, action: Selector("tap:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn)
    }
    
    func tap(sender:UIButton){
        if self.btnOpen==false && transfer==false{
            open()
        }
        else if transfer==false{
            back()
        }
    }
    
    func open(){
        
        transfer=true
        btnOpen=true
        self.controller.view.addSubview(btn_1)
        self.controller.view.addSubview(btn_2)
        self.controller.view.addSubview(btn_3)
        var root2=CGFloat(pow(2, 0.5))/2
        UIView.animateWithDuration(0.05, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            }) { (c) -> Void in
                UIView.animateWithDuration(0.4, animations: { () -> Void in
                    var rotationAnimation=CABasicAnimation(keyPath: "transform.rotation.z")
                    rotationAnimation.toValue = NSNumber(float: Float(M_PI * 2.0))
                    rotationAnimation.timingFunction=CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                    rotationAnimation.duration = 0.3
                    rotationAnimation.cumulative = false
                    rotationAnimation.removedOnCompletion = false
                    rotationAnimation.fillMode = kCAFillModeForwards
                    self.btn.layer.addAnimation(rotationAnimation, forKey: "Rotation")
                    self.btn_1.layer.addAnimation(rotationAnimation, forKey: "Rotation")
                    self.btn_2.layer.addAnimation(rotationAnimation, forKey: "Rotation")
                    self.btn_3.layer.addAnimation(rotationAnimation, forKey: "Rotation")
                    self.btn_1.frame.origin.x-=self.l+20//20
                    self.btn_2.frame.origin.x-=(self.l+20)*root2
                    self.btn_2.frame.origin.y-=(self.l+20)*root2
                    self.btn_3.frame.origin.y-=self.l+20
                    }, completion: { (com) -> Void in
                        UIView.animateWithDuration(0.24, animations: { () -> Void in
                            self.btn_1.frame.origin.x+=30//-10
                            self.btn_2.frame.origin.x+=30*root2
                            self.btn_2.frame.origin.y+=30*root2
                            self.btn_3.frame.origin.y+=30
                            }){(com) -> Void in
                                UIView.animateWithDuration(0.18, animations: { () -> Void in
                                    self.btn_1.frame.origin.x-=15//5
                                    self.btn_2.frame.origin.x-=15*root2
                                    self.btn_2.frame.origin.y-=15*root2
                                    self.btn_3.frame.origin.y-=15
                                    }){(com) -> Void in
                                        UIView.animateWithDuration(0.12, animations: { () -> Void in
                                            self.btn_1.frame.origin.x+=5//0
                                            self.btn_2.frame.origin.x+=5*root2
                                            self.btn_2.frame.origin.y+=5*root2
                                            self.btn_3.frame.origin.y+=5
                                            self.transfer=false
                                        })
                                }
                        }
                })
        }
    }
    
    func back(){
        transfer=true
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.btn_1.transform=CGAffineTransformMakeRotation(-CGFloat(M_PI/2))
            self.btn_2.transform=CGAffineTransformMakeRotation(-CGFloat(M_PI/2))
            self.btn_3.transform=CGAffineTransformMakeRotation(-CGFloat(M_PI/2))
            self.btn_1.frame.origin.x+=self.l
            self.btn_2.frame.origin.x+=self.l*CGFloat(pow(2, 0.5))/2
            self.btn_2.frame.origin.y+=self.l*CGFloat(pow(2, 0.5))/2
            self.btn_3.frame.origin.y+=self.l
            self.btn.transform=CGAffineTransformMakeRotation(-CGFloat(M_PI/2))
            
            }) {
                (com) -> Void in
                self.btnOpen=false
                self.btn_1.removeFromSuperview()
                self.btn_2.removeFromSuperview()
                self.btn_3.removeFromSuperview()
                self.transfer=false
        }
    }
    
}
