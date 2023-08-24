//
//  BadgeView.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/06/13.
//

import UIKit

class BadgeView: UIView {
    
    enum BadgeSize {
        case large
        case small
    }
    
    enum BadgeType {
        case solid
        case outline
    }
    
    let titleLabel = UILabel()
    
    init(size: BadgeSize = .small, type: BadgeType = .solid) {
        super.init(frame: .zero)
        
        switch size {
        case .large:
            setUpLargeBadgeView()
        case .small:
            setUpSmallBadgeView()
        }
        
        switch type {
        case .solid:
            self.outlineColor = AppColor.setupColor(.componentDivider)
        case .outline:
            self.backgroundColor = AppColor.setupColor(.componentTextbox)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var text: NSAttributedString = NSAttributedString() {
        didSet {
            titleLabel.attributedText = text
            titleLabel.textAlignment = .center
        }
    }
    
    var textColor: UIColor = AppColor.setupColor(.textTeritory) {
        didSet {
            titleLabel.textColor = textColor
        }
    }
    
    var outlineColor: UIColor = AppColor.setupColor(.componentDivider) {
        didSet {
            self.layer.borderWidth = 1
            self.layer.borderColor = outlineColor.cgColor
            self.backgroundColor = .clear
        }
    }
    
    // 큰 뱃지
    private func setUpLargeBadgeView() {
        self.frame = .init(x: 0, y: 0, width: 59, height: 32)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
        self.addSubview(titleLabel)
        
        titleLabel.attributedText = .attributeFont(font: .body14, text: "Label")
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        
        self.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top).inset(-5)
            $0.bottom.equalTo(titleLabel.snp.bottom).inset(-5)
            $0.leading.equalTo(titleLabel.snp.leading).inset(-12)
            $0.trailing.equalTo(titleLabel.snp.trailing).inset(-12)
        }
    }
    
    // 작은 뱃지
    private func setUpSmallBadgeView() {
        self.frame = .init(x: 0, y: 0, width: 55, height: 24)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
        self.addSubview(titleLabel)
        
        titleLabel.attributedText = .attributeFont(font: .content, text: "Label")
        titleLabel.textAlignment = .center
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        
        self.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top).inset(-5)
            $0.bottom.equalTo(titleLabel.snp.bottom).inset(-5)
            $0.leading.equalTo(titleLabel.snp.leading).inset(-12)
            $0.trailing.equalTo(titleLabel.snp.trailing).inset(-12)
        }
    }
}
