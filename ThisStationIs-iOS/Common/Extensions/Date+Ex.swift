//
//  Date+Ex.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/28.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yy.MM.dd HH:ss"
        return dateFormatter.string(from: self)
    }
}
