//
//  PopUpMessageModel.swift
//  MercadoLibreTest
//
//  Created by Juan Sebastian Florez Saavedra on 16/05/21.
//

import Foundation
import UIKit
public struct PopUpMessageModel {
    public var title: String
    public var description: String
    public var errorType: ErrorType
}

public enum ErrorType {
    case info
    case warning
    case error
    
    public func getImage() -> UIImage {
        let bundle = Bundle(identifier: "juanflorezpersonal.JSFSPopUps")

        switch self {
        case .info:
            return UIImage(named: "error", in: bundle, with: nil) ?? UIImage()
        case .warning:
            return UIImage(named: "error", in: bundle, with: nil) ?? UIImage()
        case .error:
            return UIImage(named: "error", in: bundle, with: nil) ?? UIImage()
        }
    }
    
    public func getColor() -> UIColor {
        switch self {
        case .info:
            return UIColor(red: 246.0/255.0, green: 86.0/255.0, blue: 86.0/255.0, alpha: 1)
        case .warning:
            return UIColor(red: 246.0/255.0, green: 86.0/255.0, blue: 86.0/255.0, alpha: 1)
        case .error:
            return UIColor(red: 246.0/255.0, green: 86.0/255.0, blue: 86.0/255.0, alpha: 1)
        }
    }
}
