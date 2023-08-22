//
//  MyMenuCell.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/08/15.
//

import UIKit

class MyMenuCell: UITableViewCell {
    private let menuTitleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "")
    }
    
    private let rightArrowImageView = UIImageView().then {
        $0.image = UIImage(named: "sideArrow")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitle(title: String) {
        menuTitleLabel.text = title
    }
}

extension MyMenuCell {
    private func setupView() {
        [
            menuTitleLabel, rightArrowImageView
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        menuTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(8)
            $0.leading.equalToSuperview()
                .offset(24)
        }
        
        rightArrowImageView.snp.makeConstraints {
            $0.centerY.equalTo(menuTitleLabel)
            $0.trailing.equalToSuperview()
                .inset(24)
            $0.width.height.equalTo(24)
        }
    }
}
