//
//  ShrinkCircleAnimationViewController.swift
//  Circular transition
//  Copyright © 2018 App Magic. All rights reserved.
//

import UIKit

class ShrinkCircleAnimationViewController: NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate
{
    private let scale = UIScreen.main.scale
    private let identity = CATransform3DIdentity
    weak private var transitionContext: UIViewControllerContextTransitioning?
    private var fromSnapshot: UIView?
    
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
        fromSnapshot = fromViewController?.view.snapshotView(afterScreenUpdates: false)
        let button = fromViewController?.view.viewWithTag(20) as! UIButton
        
        //3
        
        if containerView.subviews.count > 0
        {
            for subview in containerView.subviews
            {
                subview.removeFromSuperview()
            }
        }
        
        containerView.addSubview((toViewController?.view)!)
        containerView.addSubview(fromSnapshot!)
        
        //4
        
        let finalS = button.frame.width/10
        let finalX = (button.frame.origin.x + (button.frame.width/2)) - (finalS/2)
        let finalY = (button.frame.origin.y + (button.frame.width/2)) - (finalS/2)
        let finalFrame = CGRect(x: finalX, y: finalY, width: finalS, height: finalS)
        
        let circleMaskPathFinal = UIBezierPath(ovalIn: finalFrame)
        let radius = (fromViewController?.view.bounds.height)! * 1.5
        let circleMaskPathInitial = UIBezierPath(ovalIn: button.frame.insetBy(dx: -radius, dy: -radius))
        
        //5
        
        let maskLayer = CAShapeLayer()
            maskLayer.path = circleMaskPathFinal.cgPath
        
        fromSnapshot?.layer.mask = maskLayer
        
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
        if flag
        {
            fromSnapshot?.removeFromSuperview()
            transitionContext?.completeTransition(true)
        }
    }
}
