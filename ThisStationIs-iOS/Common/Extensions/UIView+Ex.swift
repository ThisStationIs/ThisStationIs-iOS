//
//  UIWindow+Ex.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/06/06.
//

import UIKit

extension UIView {
    
    func addToTopViewController() {
        if let keyWindow = UIApplication.shared.keyWindow {
            if var viewController = keyWindow.rootViewController {
                while viewController.presentedViewController != nil {
                    viewController = viewController.presentedViewController!
                }
                viewController.view.addSubview(self)
            }
        }
    }
}
