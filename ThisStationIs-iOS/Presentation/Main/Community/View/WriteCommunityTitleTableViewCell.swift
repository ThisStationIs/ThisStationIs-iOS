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
    
    let underLineView = UIView().then {
        $0.frame = .init(x: 0, y: 0, width: UIScreen.width, height: 1)
        $0.backgroundColor = AppColor.setupColor(.componentDivider)
    }
    
    func getText() -> String {
        guard let text = titleTextField.text else { return "" }
        return text
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
            underLineView,
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
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(1)
        }
    }
}
