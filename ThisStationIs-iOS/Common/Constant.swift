//
//  Constant.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/05/15.
//

import UIKit

/// Assets ColorSet에 이정된 이름
enum ColorSet {
    case accentDanger
    case accentGood
    case accentNormal
    case accentWarning

    case componentButton
    case componentDisable
    case componentDivider
    case componentIcon
    case componentTextbox
    
    case primaryEmphasize
    case primaryNormal
    
    case statusNegative
    case statusPositive
    
    case textMain
    case textSub
    case textTeritory
}


struct AppColor {
    static func setupColor(_ name: ColorSet) -> UIColor {
        switch name {
        case .accentDanger:
            return UIColor(named: "accentDanger")!
        case .accentGood:
            return UIColor(named: "accentGood")!
        case .accentNormal:
            return UIColor(named: "accentNormal")!
        case .accentWarning:
            return UIColor(named: "accentWarning")!
        case .componentButton:
            return UIColor(named: "componentButton")!
        case .componentDisable:
            return UIColor(named: "componentDisable")!
        case .componentDivider:
            return UIColor(named: "componentDivider")!
        case .componentIcon:
            return UIColor(named: "componentIcon")!
        case .componentTextbox:
            return UIColor(named: "componentTextbox")!
        case .primaryEmphasize:
            return UIColor(named: "primaryEmphasize")!
        case .primaryNormal:
            return UIColor(named: "primaryNormal")!
        case .statusNegative:
            return UIColor(named: "statusNegative")!
        case .statusPositive:
            return UIColor(named: "statusPositive")!
        case .textMain:
            return UIColor(named: "textMain")!
        case .textSub:
            return UIColor(named: "textSub")!
        case .textTeritory:
            return UIColor(named: "textTeritory")!
        }
    }
    
}
