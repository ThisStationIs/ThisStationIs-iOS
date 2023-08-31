//
//  SelectLineTableVewCell.swift
//  ThisStationIs-iOS
//
//  Created by Muzlive_Player on 2023/08/31.
//

import UIKit

class SelectLineTableVewCell: UITableViewCell {
    private let titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading16, text: "호선 선택")
    }
    
    private let placeholderLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "호선을 선택해주세요.")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    private let downArrwonIcon = UIImageView().then {
        $0.image = UIImage(named: "downArrow")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectLineTableVewCell {
    private func setupView() {
        [
            titleLabel,
            placeholderLabel, downArrwonIcon
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
        
        placeholderLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
                .offset(18)
            $0.leading.equalToSuperview()
                .offset(40)
        }
        
        downArrwonIcon.snp.makeConstraints {
            $0.centerY.equalTo(placeholderLabel)
            $0.trailing.equalToSuperview()
                .offset(-40)
        }
    }
}
