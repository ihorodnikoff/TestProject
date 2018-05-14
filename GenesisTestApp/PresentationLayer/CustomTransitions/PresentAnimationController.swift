//
//  PresentAnimationController.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit

class PresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.4
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
    guard let fromVC = transitionContext.viewController(forKey: .from),
      let toVC = transitionContext.viewController(forKey: .to)
      else {
        return
    }
    
    let containerView = transitionContext.containerView

    containerView.addSubview(toVC.view)
    
    let duration = transitionDuration(using: transitionContext)
    UIView.animate(withDuration: duration, animations: {
      toVC.view.bounds.size.width = fromVC.view.frame.size.width * 0.75
      toVC.view.bounds.size.height = fromVC.view.frame.size.height * 0.75
      toVC.view.center = fromVC.view.center
    }) { (completed) in
      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
  }
}
