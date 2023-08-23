//
//  TabBarItemType.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/08/22.
//

import Foundation

enum TabBarItemType: String, CaseIterable {
    case home, community, writting, history, my
    
    init?(index: Int) {
        switch index {
        case 0: self = .home
        case 1: self = .community
        case 2: self = .writting
        case 3: self = .history
        case 4: self = .my
        default: return nil
        }
    }
    
    func toInt() -> Int {
        switch self {
        case .home: return 0
        case .community: return 1
        case .writting: return 2
        case .history: return 3
        case .my: return 4
        }
    }
    
    func toKrName() -> String {
        switch self {
        case .home: return "홈"
        case .community: return "게시판"
        case .writting: return ""
        case .history: return "내 활동"
        case .my: return "마이페이지"
        }
    }
    
    func toIconName() -> String {
        switch self {
        case .home: return "home"
        case .community: return "board"
        case .writting: return "writting"
        case .history: return "history"
        case .my: return "my"
        }
    }
}
