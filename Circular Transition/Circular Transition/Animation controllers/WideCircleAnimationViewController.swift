//
//  WideCircleAnimationViewController.swift
//  Circular transition
//  Copyright © 2018 App Magic. All rights reserved.
//

import UIKit

class WideCircleAnimationViewController: NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate
{
    private let scale = UIScreen.main.scale
    private let identity = CATransform3DIdentity
    weak var transitionContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        //1
        
        self.transitionContext = transitionContext
        
        //2
        
        let containerView = transitionContext.containerView
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let button = fromViewController?.view.viewWithTag(20) as! UIButton
            button.tag = 0
        
        //3
        
        containerView.addSubview((fromViewController?.view)!)
        containerView.addSubview((toViewController?.view)!)
        
        toViewController?.view.clipsToBounds = false
        fromViewController?.view.clipsToBounds = false
        toViewController?.view.layer.masksToBounds = false
        fromViewController?.view.layer.masksToBounds = false
        
        //4
        
        let circleMaskPathInitial = UIBezierPath(ovalIn: button.frame)
        let radius = (toViewController?.view.bounds.height)! * 1.5
        let circleMaskPathFinal = UIBezierPath(ovalIn: button.frame.insetBy(dx: -radius, dy: -radius))
        
        //5
        
        let maskLayer = CAShapeLayer()
            maskLayer.path = circleMaskPathFinal.cgPath
        
        toViewController?.view.layer.mask = maskLayer
        
        //6
        
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
            maskLayerAnimation.fromValue = circleMaskPathInitial.cgPath
            maskLayerAnimation.toValue = circleMaskPathFinal.cgPath
            maskLayerAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            maskLayerAnimation.duration = transitionDuration(using: transitionContext)
            maskLayerAnimation.delegate = self
        
            maskLayer.add(maskLayerAnimation, forKey: "path")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool)
    {
        transitionContext?.completeTransition(!transitionContext!.transitionWasCancelled)
        transitionContext?.viewController(forKey: UITransitionContextViewControllerKey.from)?.view.layer.mask = nil
    }
}
