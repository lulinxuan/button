//
//  ThereeBtnPopUp.swift
//  button
//
//  Created by LuLinxuan on 26/12/14.
//  Copyright (c) 2014 LuLinxuan. All rights reserved.
//

import UIKit

class ThreeBtnPopUp: UIView {
    
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
    
    //Set all the property of the four buttons first like image, action ect.By default the three button will pop up to the upper right, if you want to change it to other direction,change by your self. the distance stands for how long to buttons will pop up tp.
    init(frame: CGRect,centerBtn:UIButton,button_1:UIButton,button_2:UIButton,button_3:UIButton,distance:CGFloat=80,ViewController:UIViewController) {
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
        if btnOpen==false && transfer==false
        {
            transfer=true
            btnOpen=true
            self.controller.view.addSubview(btn_1)
            self.controller.view.addSubview(btn_2)
            self.controller.view.addSubview(btn_3)
            
            UIView.animateWithDuration(0.05, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                }) { (c) -> Void in
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        
                        self.btn_1.frame.origin.y-=self.l+14//+7
                        self.btn_2.frame.origin.y-=self.l*2+24//+12
                        self.btn_3.frame.origin.y-=self.l*3+34//+17
                        }, completion: { (com) -> Void in
                            UIView.animateWithDuration(0.2, animations: { () -> Void in
                                self.btn_1.frame.origin.y+=22//-4
                                self.btn_2.frame.origin.y+=36//-6
                                self.btn_3.frame.origin.y+=52//-11
                                self.shrink(self.btn_1)
                                self.shrink(self.btn_2)
                                self.shrink(self.btn_3)
                                }){(com) -> Void in
                                    UIView.animateWithDuration(0.15, animations: { () -> Void in
                                        self.btn_1.frame.origin.y-=12//+2
                                        self.btn_2.frame.origin.y-=18//+3
                                        self.btn_3.frame.origin.y-=28//+5
                                        
                                        }){(com) -> Void in
                                            UIView.animateWithDuration(0.12, animations: { () -> Void in
                                                self.btn_1.frame.origin.y+=4//0
                                                self.btn_2.frame.origin.y+=6//0
                                                self.btn_3.frame.origin.y+=10//0
                                                }){(com) -> Void in
                                                    self.transfer=false
                                            }
                                    }
                            }
                    })
            }
        }
        else if btnOpen==true && transfer==false
        {
            transfer=true
            UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                
                self.btn_1.frame.origin.y+=self.l
                self.btn_2.frame.origin.y+=self.l*2
                self.btn_3.frame.origin.y+=self.l*3
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
    
    func back(){
        transfer=true
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            
            self.btn_1.frame.origin.y+=self.l
            self.btn_2.frame.origin.y+=self.l*2
            self.btn_3.frame.origin.y+=self.l*3
            
            }) {
                (com) -> Void in
                self.btnOpen=false
                self.btn_1.removeFromSuperview()
                self.btn_2.removeFromSuperview()
                self.btn_3.removeFromSuperview()
                self.transfer=false
        }
    }
    
    func shrink(view:UIView){
        var frame=view.frame
        
        UIView.animateWithDuration(0.14, animations: { () -> Void in
            view.frame=CGRect(x: frame.origin.x+frame.width*0.03, y: frame.origin.y+frame.height*0.03, width: frame.width*0.94, height: frame.height*0.94)
            })
            {
                (com) -> Void in
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    view.frame=CGRect(x: frame.origin.x+frame.width*0, y: frame.origin.y+frame.height*0, width: frame.width*1, height: frame.height*1)
                })
        }
        
    }
    
}