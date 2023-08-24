//
//  MyTableViewHeader.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/08/15.
//

import UIKit

class MyTableViewHeader: UITableViewHeaderFooterView {
    private let userImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.image = UIImage(named: "profile")
    }
    
    private let userLabelStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 8
    }
    
    private let userNicknameLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "행복한 바나나")
        $0.textColor = .white
    }
    
    private let userIdLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "UID 123")
        $0.textColor = .white
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupLayout()
        setupAttribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAttribute() {
        userImageView.layer.cornerRadius = 29
    }
}

extension MyTableViewHeader {
    private func setupView() {
        contentView.backgroundColor = AppColor.setupColor(.primaryNormal)
        [
            userImageView,
            userLabelStackView
//            userNicknameLabel,
//            userIdLabel
        ].forEach {
            contentView.addSubview($0)
        }
        
        [
            userNicknameLabel,
            userIdLabel
        ].forEach {
            userLabelStackView.addArrangedSubview($0)
        }
    }
    
    private func setupLayout() {
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(16)
            $0.leading.equalToSuperview()
                .offset(24)
            $0.width.height.equalTo(58)
        }
        
        userLabelStackView.snp.makeConstraints {
            $0.leading.equalTo(userImageView.snp.trailing)
                .offset(16)
            $0.centerY.equalTo(userImageView)
        }
    }
}
