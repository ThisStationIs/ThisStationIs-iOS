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
    
    func changeStatusBarBgColor(bgColor: UIColor?) {
       if #available(iOS 13.0, *) {
           let window = UIApplication.shared.windows.first
           let statusBarManager = window?.windowScene?.statusBarManager
           
           let statusBarView = UIView(frame: statusBarManager?.statusBarFrame ?? .zero)
           statusBarView.backgroundColor = bgColor
           
           window?.addSubview(statusBarView)
       } else {
           let statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
           statusBarView?.backgroundColor = bgColor
       }
   }
}
