//
//  PostTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/06/13.
//

import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    let containerView = UIView()
    
    let profileImageView = UIImageView().then {
        $0.frame = .init(x: 0, y: 0, width: 32, height: 32)
        $0.image = UIImage(named: "profile")
    }
    
    var usernameLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "행복한 바나나")
    }
    
    var writeDateLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "23.03.09 17:37")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    var lineBadge = BadgeView().then {
        $0.text = .attributeFont(font: .content, text: "1호선")
        $0.textColor = .systemBlue
        $0.backgroundColor = .systemBlue.withAlphaComponent(0.1)
    }
    
    var categoryBadge = BadgeView().then {
        $0.text = .attributeFont(font: .content, text: "연착정보")
        $0.textColor = AppColor.setupColor(.textSub)
        $0.backgroundColor = AppColor.setupColor(.textSub).withAlphaComponent(0.1)
    }
    
    var titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading18, text: "제목")
        $0.numberOfLines = 2
    }
    
    var contentLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리")
        $0.numberOfLines = 2
    }
    
    let commentView = UIView()
    
    let commentIamgeView = UIImageView().then {
        $0.frame = .init(x: 0, y: 0, width: 24, height: 24)
        $0.image = UIImage(named: "comment")
    }
    
    let commentCountLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "0")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    init(reuseIdentifier: String?, postData: PostModel) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupView()
        setUpData(postData)
        //        self.backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpData(_ postData: PostModel) {
        // 데이터 세팅
        usernameLabel.attributedText = .attributeFont(font: .body16, text: postData.userName)
        titleLabel.attributedText = .attributeFont(font: .heading18, text: postData.title)
        contentLabel.attributedText = .attributeFont(font: .body16, text: postData.content)
        writeDateLabel.attributedText = .attributeFont(font: .body14, text: postData.writeDate)
        
        // 호선 색상 세팅
        lineBadge.text = .attributeFont(font: .content, text: postData.subway)
        lineBadge.textColor = AppColor.setupLineColor(postData.subway)
        lineBadge.backgroundColor = AppColor.setupLineColor(postData.subway).withAlphaComponent(0.1)
        
        categoryBadge.text = .attributeFont(font: .content, text: postData.category)
    }
    
    private func setupView() {
        self.backgroundColor = .white
        
        self.contentView.addSubview(containerView)
        
        // ContentView에 추가
        [
            profileImageView,
            usernameLabel,
            writeDateLabel,
            lineBadge,
            categoryBadge,
            titleLabel,
            contentLabel,
            commentView
        ].forEach {
            self.containerView.addSubview($0)
        }
        
        // commentView
        [
            commentIamgeView,
            commentCountLabel
        ].forEach {
            self.commentView.addSubview($0)
        }
        
        /// SetLayout
        setupLayout()
    }
    
    private func setupLayout() {
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
        
        commentIamgeView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        commentCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(commentIamgeView)
            $0.leading.equalTo(commentIamgeView.snp.trailing).offset(8)
        }
        
        commentView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.top.equalTo(commentIamgeView.snp.top)
            $0.bottom.equalTo(commentIamgeView.snp.bottom)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).inset(-16)
            $0.bottom.equalTo(commentView.snp.bottom).inset(-8)
            $0.edges.equalToSuperview()
        }
    }
}
