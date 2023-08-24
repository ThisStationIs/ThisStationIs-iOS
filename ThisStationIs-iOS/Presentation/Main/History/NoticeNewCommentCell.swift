//
//  NoticeNewCommentCell.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/08/13.
//

import UIKit
import Then
import SnapKit

class NoticeNewCommentCell: UITableViewCell {
    private let lineView = UIView().then {
        $0.backgroundColor = .red
    }
    
    private let noticeTitleLabel = UILabel().then {
        $0.textColor = AppColor.setupColor(.textMain)
        $0.font = .systemFont(ofSize: 14)
        $0.text = "test title"
    }
    
    private let noticeDateLabel = UILabel().then {
        $0.textColor = AppColor.setupColor(.textSub)
        $0.font = .systemFont(ofSize: 14)
        $0.text = "test Date"
    }

    private let newCommentLabel = UILabel().then {
        $0.textColor = AppColor.setupColor(.textMain)
        $0.font = .systemFont(ofSize: 16)
        $0.text = "새로운 댓글이 등록되었습니다."
    }
    
    private let newCommentContentLabel = UILabel().then {
        $0.textColor = AppColor.setupColor(.textSub)
        $0.font = .systemFont(ofSize: 16)
        $0.text = "test new Comment"
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

extension NoticeNewCommentCell {
    private func setupView() {
        [
            lineView, noticeTitleLabel, noticeDateLabel,
            newCommentLabel,
            newCommentContentLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        lineView.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(8)
            $0.leading.equalToSuperview()
                .offset(24)
            // TODO: 삭제할 코드
            $0.width.equalTo(53)
            $0.height.equalTo(24)
        }
        
        noticeTitleLabel.snp.makeConstraints {
            $0.centerY.equalTo(lineView)
            $0.leading.equalTo(lineView.snp.trailing)
                .offset(8)
        }
        
        noticeDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(lineView)
            $0.trailing.equalToSuperview()
                .offset(-24)
        }
        
        newCommentLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom)
                .offset(8)
            $0.leading.equalTo(lineView)
        }
        
        newCommentContentLabel.snp.makeConstraints {
            $0.top.equalTo(newCommentLabel.snp.bottom)
                .offset(8)
            $0.leading.equalTo(lineView)
        }

    }
}
