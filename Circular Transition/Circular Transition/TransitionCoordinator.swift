//
//  TransitionCoordinator.swift
//  Circular transition
//  Copyright © 2018 App Magic. All rights reserved.
//

import UIKit

class TransitionCoordinator: NSObject, UINavigationControllerDelegate
{
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        if operation == .push
        {
            return WideCircleAnimationViewController()
        }
        
        return ShrinkCircleAnimationViewController()
    }
}
