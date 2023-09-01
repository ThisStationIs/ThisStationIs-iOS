//
//  WriteCommunityContentsTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by Muzlive_Player on 2023/08/31.
//

import UIKit

class WriteCommunityContentsTableViewCell: UITableViewCell {
    private let contentTextView = TextView().then {
        $0.attributedText = .attributeFont(font: .body16, text: "")
        $0.backgroundColor = .white
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getText() -> String {
        guard let text = contentTextView.text else { return "" }
        return text
    }
}

extension WriteCommunityContentsTableViewCell {
    private func setupView() {
        [
            contentTextView,
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        contentTextView.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview()
        }
    }
}
