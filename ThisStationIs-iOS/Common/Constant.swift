//
//  Constant.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/05/15.
//

import Foundation

/// Assets ColorSet에 이정된 이름
enum ColorSet: String {
    case divider = "divider"
    case error = "error"
    case primaryLight = "primaryLight"
    case primary = "primary"
    
    var name: String {
        return self.rawValue
    }
}
