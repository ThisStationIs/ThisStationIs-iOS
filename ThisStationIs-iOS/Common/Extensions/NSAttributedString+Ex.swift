//
//  NSAttributedString+Ex.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/05/22.
//

import UIKit

enum TSIFontType {
    /// heading
    case heading24
    case heading20
    case heading16
    case heading18
    
    /// body
    case body18
    case body16
    case body14
    case button
    
    /// meta
    case label
    case content
}


extension NSAttributedString {
    /**
        NSAttributeString 확장
        **사용방법**
     
        .attributeFont(font: .heading24, text: "사용방법", lineHeight: 10)
     
        lineHeight는 옵셔널
     */
    class func attributeFont(font: TSIFontType, text: String, lineHeight: CGFloat = 0) -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        
        var setFont = UIFont()
        switch font {
        case .heading24:
            // weight 500
            setFont = UIFont.systemFont(ofSize: 24, weight: .medium)
        case .heading20:
            // weight 500
            setFont = UIFont.systemFont(ofSize: 20, weight: .medium)
        case .heading16:
            // weight 700
            setFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        case .heading18:
            setFont = UIFont.systemFont(ofSize: 18, weight: .bold)
        case .body18:
            setFont = UIFont.systemFont(ofSize: 18, weight: .regular)
        case .body16:
            // weight 400
            setFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        case .body14:
            // weight 400
            setFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        case .button:
            // weight 500
            setFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        case .label:
            // weight 500
            setFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        case .content:
            // weight 500
            setFont = UIFont.systemFont(ofSize: 12, weight: .regular)
        }
        
        paragraphStyle.lineSpacing = lineHeight - setFont.lineHeight
        paragraphStyle.lineBreakMode = .byTruncatingTail
        
        attributeString.addAttributes([
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            .font: setFont
        ], range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }
}
