//
//  MyTitleCell.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/08/15.
//

import UIKit

enum MyTitleType {
    case noVersion
    case isVersion
}

class MyTitleCell: UITableViewCell {
    private let titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading20, text: "")
    }
    
    private let versionLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "1.0.0")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    private let borderLineView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.componentDivider)
    }
    
    var version: MyTitleType = .noVersion
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        setupLayout()
    }
    
    func setupTitle(title: String) {
        titleLabel.text = title
    }
}

extension MyTitleCell {
    private func setupView() {
        [
            titleLabel, versionLabel,
            borderLineView
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(8)
            $0.leading.equalToSuperview()
                .offset(24)
        }
        
        if version == .isVersion {
            print("### hi")
            versionLabel.snp.makeConstraints {
                $0.centerY.equalTo(titleLabel)
                $0.trailing.equalToSuperview()
                    .inset(24)
            }
        }
        
        borderLineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
                .offset(8)
            $0.leading.trailing.equalToSuperview()
                .inset(24)
            $0.height.equalTo(1)
        }
    }
}
