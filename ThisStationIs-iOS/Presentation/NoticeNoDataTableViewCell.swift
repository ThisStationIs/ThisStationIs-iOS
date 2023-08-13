//
//  NoticeNoDataTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/07/05.
//

import UIKit
import Then
import SnapKit

class NoticeNoDataTableViewCell: UITableViewCell {
    private let noticeLabel = UILabel().then {
        $0.textColor = AppColor.setupColor(.textSub)
        $0.font = .systemFont(ofSize: 16)
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

extension NoticeNoDataTableViewCell {
    private func setupView(){
        contentView.addSubview(noticeLabel)
    }
    
    private func setupLayout(){
        noticeLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
        
    func setupText(text: String){
        noticeLabel.text = text
    }
}
