//
//  ViewController.swift
//  SplashAnimationButton
//
//  Created by Atuooo on 5/10/16.
//  Copyright © 2016 oOatuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(red: 0.580, green: 0.827, blue: 0.498, alpha: 1)
        
        let splashButton = SplashButton(frame: CGRect(x: view.frame.width - 60, y: view.frame.height - 60, width: 45, height: 45))
        view.addSubview(splashButton)
//        UIApplication.sharedApplication().keyWindow?.addSubview(splashButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

