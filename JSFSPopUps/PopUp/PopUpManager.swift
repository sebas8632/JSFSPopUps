//
//  PopUpManager.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 16/05/21.
//

import Foundation
import UIKit
public class PopUpManager {
    
    public static func showError(error: String, from view: UIViewController) {
        let pop = PopUpMessageViewController()
        pop.popUp = PopUpMessageModel(title: "¡Ops!", description: error, errorType: .error)
        PopUpAnimation.showPopUp(superView: view, popUpViewController: pop)
    }
}
