//
//  PopUpAnimation.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 16/05/21.
//

import Foundation
import UIKit

class PopUpAnimation {
    
    static func showAnimate(popUpView: UIViewController) {
        popUpView.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpView.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            popUpView.view.alpha = 1.0
            popUpView.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    static func removeAnimate(childView: UIViewController, action: @escaping () -> Void) {
        UIView.animate(withDuration: 0.25, animations: {
            childView.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            childView.view.alpha = 0.0
        }, completion: {(finished: Bool)  in
            if finished {
                childView.view.removeFromSuperview()
                action()
                
            }
        })
    }
    
    static func showPopUp(superView: UIViewController, popUpViewController: UIViewController) {
        popUpViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)

        popUpViewController.modalPresentationStyle = .fullScreen
        superView.addChild(popUpViewController)
        popUpViewController.view.frame = superView.view.frame
        superView.view.addSubview(popUpViewController.view)
        popUpViewController.didMove(toParent: superView)
    }
}
