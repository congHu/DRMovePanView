//
//  ViewController.swift
//  TwoFingerGes
//
//  Created by David on 16/7/3.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    var drmView:DRMovePanView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        drmView = DRMovePanView(frame: CGRect(x: 100, y: 100, width: 50, height: 50), gestureLocatingView: view)
        view.addSubview(drmView)
        drmView.backgroundColor = UIColor.greenColor()
        let sbView = UIView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        sbView.backgroundColor = UIColor.blueColor()
        drmView.addSubview(sbView)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

