//
//  AnimatedTransitioning.swift
//  Navigation
//
//  Created by Vương Toàn Bắc on 5/28/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

class AnimatedTransitioning: NSObject,UIViewControllerAnimatedTransitioning {
    var isPresent = false
    let dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        
        let containerView = transitionContext.containerView
        let wight = toViewController.view.bounds.width * 0.7
        let height = toViewController.view.bounds.height
        
        if isPresent{
            dimmingView.backgroundColor = .red
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            containerView.addSubview(toViewController.view)
            toViewController.view.frame = CGRect(x: -wight , y: 0, width: wight,height: height )
        }
        let tranform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: wight, y: 0)
        }
        let identity = {
            self.dimmingView.alpha = 0.5
            fromViewController.view.transform = .identity
        }
        
        
        let duration = transitionDuration(using: transitionContext)
        let isCancel = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresent ? tranform() : identity()
        }){ (_) in
            transitionContext.completeTransition(!isCancel)
            
        }
        
        
    }
}
