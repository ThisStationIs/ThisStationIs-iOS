//
//  WriteCommunityContentsTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by Muzlive_Player on 2023/08/31.
//

import UIKit

class WriteCommunityContentsTableViewCell: UITableViewCell {
    private let contentTextField = UITextField().then {
        $0.placeholder = "선택하신 태그와 관련된 글로 입력해주세요. \n댓글이 있는 경우 수정이 불가능합니다."
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

extension WriteCommunityContentsTableViewCell {
    private func setupView() {
        [
            contentTextField,
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        contentTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(16)
            $0.leading.trailing.equalToSuperview()
                .offset(-24)
            $0.bottom.equalToSuperview()
        }
    }
}
