//
//  WriteCommunityTitleTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by Muzlive_Player on 2023/08/31.
//

import UIKit

class WriteCommunityTitleTableViewCell: UITableViewCell {
    private let titleTextField = UITextField().then {
        $0.placeholder = "제목을 입력해주세요 (최대 20자)"
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

extension WriteCommunityTitleTableViewCell {
    private func setupView() {
        [
            titleTextField,
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        titleTextField.snp.makeConstraints {
            $0.leading.equalToSuperview()
                .offset(24)
            $0.centerY.equalToSuperview()
        }
    }
}
