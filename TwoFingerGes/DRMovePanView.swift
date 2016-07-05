//
//  DRMovePanView.swift
//  TwoFingerGes
//
//  Created by David on 16/7/4.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

class DRMovePanView: UIView {

    var movable = true
    var scaleOnMove = true
    var scaleRatio:CGFloat = 1.1
    
    private var touchBegin = false
    var isTouching:Bool{
        get{
            return touchBegin
        }
    }
    
    private var ges:UIPanGestureRecognizer!
    private var panOffset:(x: CGFloat, y:CGFloat) = (0,0)
    var offset:CGPoint{
        get{
            return CGPoint(x: panOffset.x, y: panOffset.y)
        }
    }
    
    private var containedRect:UIView?
    var gestureLocatingView:UIView?{
        get{
            return containedRect
        }
        set(view){
            containedRect = view
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ges = UIPanGestureRecognizer(target: self, action: #selector(DRMovePanView.panGes(_:)))
        self.addGestureRecognizer(ges)
        NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(DRMovePanView.timer), userInfo: nil, repeats: true)
    }
    
    convenience init(frame: CGRect, gestureLocatingView: UIView) {
        self.init(frame: frame)
        containedRect = gestureLocatingView
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc private func timer(){
        if ges.state == .Possible{
            touchBegin = false
            if scaleOnMove{
                UIView.animateWithDuration(0.2, animations: {
                    self.transform = CGAffineTransformMakeScale(1.0, 1.0)
                })
            }
        }
    }
    
    @objc private func panGes(sender:UIPanGestureRecognizer){
        if movable{
            if touchBegin{
                self.center = CGPoint(x: sender.locationInView(containedRect).x - panOffset.x, y: sender.locationInView(containedRect).y - panOffset.y)
            }else{
                if containedRect == nil{
                    containedRect = sender.view?.superview
                }
                
                panOffset = (sender.locationInView(containedRect).x - self.center.x, sender.locationInView(containedRect).y - self.center.y)
                touchBegin = true
                
                if scaleOnMove{
                    UIView.animateWithDuration(0.2, animations: { 
                        self.transform = CGAffineTransformMakeScale(self.scaleRatio, self.scaleRatio)
                    })
                }
            }
        }
        
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
