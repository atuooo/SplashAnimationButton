//
//  SplashButton.swift
//  SplashAnimationButton
//
//  Created by Atuooo on 5/10/16.
//  Copyright © 2016 oOatuo. All rights reserved.
//

import UIKit

class SplashButton: UIButton {
    private var hasShowed = false
    private lazy var splashView : SplashView = {
        let view = SplashView(frame: self.superview!.frame)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
        setBackgroundImage(UIImage(named: "plus"), forState: .Normal)
        backgroundColor = UIColor.whiteColor()
        
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 7.0
        layer.shadowOffset = CGSizeZero
        
        addTarget(self, action: #selector(action), forControlEvents: .TouchUpInside)
    }
    
    func action() {
        if hasShowed {
            splashAnimtion()

            buttonAnimation({
                    self.transform = CGAffineTransformIdentity
                }, completion: { _ in
                    self.hasShowed = false
                    self.splashView.removeFromSuperview()
            })

        } else {
            
            superview?.addSubview(splashView)
            superview?.bringSubviewToFront(self)
            splashAnimtion()
            
            buttonAnimation({
                    self.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
                }, completion: { _ in
                    self.hasShowed = true
            })
        }
    }
    
    private func buttonAnimation(animation: () -> Void, completion: (Bool) -> Void) {
        UIView.animateWithDuration(0.3,
                                   delay: 0,
                                   usingSpringWithDamping: 0.5,
                                   initialSpringVelocity: 0.3,
                                   options: [],
                                   animations: animation,
                                   completion: completion)
    }
    
    private func splashAnimtion() {
        let startPath = UIBezierPath(ovalInRect: frame).CGPath
        let finalRaduis = sqrt(center.x * center.x + center.y * center.y)
        let finalPath = UIBezierPath(ovalInRect: CGRectInset(frame, -finalRaduis, -finalRaduis)).CGPath
        
        let maskLayer = CAShapeLayer()
        maskLayer.opaque = false
        maskLayer.path = hasShowed ? startPath : finalPath
        splashView.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = hasShowed ? finalPath : startPath
        maskLayerAnimation.toValue = hasShowed ? startPath : finalPath
        maskLayerAnimation.duration = 0.3
        maskLayerAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        maskLayerAnimation.removedOnCompletion = false
        maskLayerAnimation.fillMode = kCAFillModeForwards
        
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
