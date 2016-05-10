//
//  SplashView.swift
//  SplashAnimationButton
//
//  Created by Atuooo on 5/10/16.
//  Copyright © 2016 oOatuo. All rights reserved.
//

import UIKit

class SplashView: UIVisualEffectView {
    init(frame: CGRect, effect: UIVisualEffect = UIBlurEffect(style: .ExtraLight)) {
        super.init(effect: effect)
        self.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


