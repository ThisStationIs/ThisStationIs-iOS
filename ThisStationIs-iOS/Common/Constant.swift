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

enum LineColorSet: String {
    case lineOne = "1호선"
    case lineTwo = "2호선"
    case lineThree = "3호선"
    case lineFour = "4호선"
    case lineFive = "5호선"
    case lineSix = "6호선"
    case lineSeven = "7호선"
    case lineEight = "8호선"
    case lineNine = "9호선"
    case 인천1호선 = "인천 1호선"
    case 인천2호선 = "인천 2호선"
    case 수인분당선 = "수인분당선"
    case 신분당선 = "신분당선"
    case 경의중앙선 = "경의중앙선"
    case 공항철도 = "공항철도"
    case 경춘선 = "경춘선"
    case 의정부경전철 = "의정부경전철"
    case 용인에버라인 = "용인에버라인"
    case 경강선 = "경강선"
    case 우이신설선 = "우이신설선"
    case 서해선 = "서해선"
    case 김포골드라인 = "김포골드라인"
    case 신림선 = "신림선"
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
    
    static func setupLineColor(_ name: LineColorSet.RawValue) -> UIColor {
        switch name {
        case "1호선":
            return UIColor(named: "1호선")!
        case "2호선":
            return UIColor(named: "2호선")!
        case "3호선":
            return UIColor(named: "3호선")!
        case "4호선":
            return UIColor(named: "4호선")!
        case "5호선":
            return UIColor(named: "5호선")!
        case "6호선":
            return UIColor(named: "6호선")!
        case "7호선":
            return UIColor(named: "7호선")!
        case "8호선":
            return UIColor(named: "8호선")!
        case "9호선":
            return UIColor(named: "9호선")!
        case "인천 1호선":
            return UIColor(named: "인천1호선")!
        case "인천 2호선":
            return UIColor(named: "인천2호선")!
        case "수인분당선":
            return UIColor(named: "수인분당선")!
        case "신분당선":
            return UIColor(named: "신분당선")!
        case "경의중앙선":
            return UIColor(named: "경의중앙선")!
        case "공항철도":
            return UIColor(named: "공항철도")!
        case "경춘선":
            return UIColor(named: "경춘선")!
        case "의정부경전철":
            return UIColor(named: "의정부경전철")!
        case "용인에버라인":
            return UIColor(named: "용인에버라인")!
        case "경강선":
            return UIColor(named: "경강선")!
        case "우이신설선":
            return UIColor(named: "우이신설선")!
        case "서해선":
            return UIColor(named: "서해선")!
        case "김포골드라인":
            return UIColor(named: "김포골드라인")!
        case "신림선":
            return UIColor(named: "신림선")!
        default:
            return UIColor(named: "1호선")!
        }
    }
}
