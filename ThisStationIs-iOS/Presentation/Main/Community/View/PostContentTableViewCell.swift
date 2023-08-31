//
//  PostContentTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/24.
//

import UIKit

class PostContentTableViewCell: UITableViewCell {
    
    let containerView = UIView()
    
    let profileImageView = UIImageView().then {
        $0.frame = .init(x: 0, y: 0, width: 32, height: 32)
        $0.image = UIImage(named: "profile")
    }
    
    let usernameLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "행복한 바나나")
    }
    
    let writeDateLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "23.03.09 17:37")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    let lineBadge = BadgeView().then {
        $0.text = .attributeFont(font: .content, text: "1호선")
        $0.textColor = .systemBlue
        $0.backgroundColor = .systemBlue.withAlphaComponent(0.1)
    }
    
    let categoryBadge = BadgeView().then {
        $0.text = .attributeFont(font: .content, text: "연착정보")
        $0.textColor = AppColor.setupColor(.textSub)
        $0.backgroundColor = AppColor.setupColor(.textSub).withAlphaComponent(0.1)
    }
    
    let titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading18, text: "제목")
        $0.numberOfLines = 2
    }
    
    let contentLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리")
        $0.numberOfLines = 0
    }
    
    let commentIamgeView = UIImageView().then {
        $0.frame = .init(x: 0, y: 0, width: 24, height: 24)
        $0.image = UIImage(named: "comment")
    }
    
    let commentCountLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "0")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    let bottomSeparatorView = UIView().then {
        $0.frame = .init(x: 0, y: 0, width: UIScreen.width - 24, height: 1)
        $0.backgroundColor = AppColor.setupColor(.componentDivider)
    }
    
    init(reuseIdentifier: String?, postData: PostModel) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpData(postData)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpData(_ postData: PostModel) {
        usernameLabel.attributedText = .attributeFont(font: .body16, text: postData.userName)
        titleLabel.attributedText = .attributeFont(font: .heading18, text: postData.title)
        contentLabel.attributedText = .attributeFont(font: .body16, text: postData.content)
        writeDateLabel.attributedText = .attributeFont(font: .body14, text: postData.writeDate)
        
        lineBadge.text = .attributeFont(font: .content, text: postData.subway)
        lineBadge.textColor = AppColor.setupLineColor(postData.subway)
        lineBadge.backgroundColor = AppColor.setupLineColor(postData.subway).withAlphaComponent(0.1)
        
        categoryBadge.text = .attributeFont(font: .content, text: postData.category)
    }
    
    private func setUpView() {
        self.contentView.addSubview(containerView)
        
        [
            profileImageView,
            usernameLabel,
            writeDateLabel,
            lineBadge,
            categoryBadge,
            titleLabel,
            contentLabel,
            commentIamgeView,
            commentCountLabel,
            bottomSeparatorView,
        ].forEach {
            containerView.addSubview($0)
        }
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(24)
            $0.width.height.equalTo(32)
        }
        
        usernameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.width.equalTo(201).priority(.medium)
        }
        
        writeDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        lineBadge.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(24)
        }
        
        categoryBadge.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.leading.equalTo(lineBadge.snp.trailing).offset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(lineBadge.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        commentCountLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalTo(commentIamgeView)
        }
        
        commentIamgeView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.width.height.equalTo(24)
            $0.trailing.equalTo(commentCountLabel.snp.leading).inset(-8)
        }
        
        bottomSeparatorView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(30)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(30)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).inset(-16)
            $0.bottom.equalTo(bottomSeparatorView.snp.bottom).inset(-30)
            $0.edges.equalToSuperview()
        }
    }
}
