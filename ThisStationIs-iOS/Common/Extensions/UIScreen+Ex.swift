//
//  UIScreen+Ex.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/07/13.
//

import UIKit

extension UIScreen {
    /// 디바이스 화면 넓이
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// 디바이스 화면 높이
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
}
