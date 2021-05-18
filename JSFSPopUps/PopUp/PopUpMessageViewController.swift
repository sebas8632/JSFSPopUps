//
//  PopUpMessageViewController.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 16/05/21.
//

import UIKit

class PopUpMessageViewController: UIViewController {

    var popUp: PopUpMessageModel?
    
    unowned var popUpView: PopUpMessageView { return self.view as! PopUpMessageView }
    unowned var dismissButton: UIButton { return popUpView.dismissButton }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
        PopUpAnimation.showAnimate(popUpView: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func loadView() {
        view = PopUpMessageView(popUpMessage: popUp!)
    }
    
    private func setupTargets() {
        dismissButton.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
     }
     
     @objc private func tapDismissButton() {
        PopUpAnimation.removeAnimate(childView: self, action: {})
     }

}
