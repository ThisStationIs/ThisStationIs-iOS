//
//  PostTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/06/13.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let profileView = UIView()
    let profileAndDateView = UIView()
    let badgeView = UIView()
    let commnetView = UIView()
    
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
        $0.attributedText = .attributeFont(font: .heading16, text: "제목")
        $0.numberOfLines = 2
    }
    
    let contentLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리 주저리")
        $0.numberOfLines = 2
    }
    
    let commentIamgeView = UIImageView().then {
        $0.frame = .init(x: 0, y: 0, width: 24, height: 24)
        $0.image = UIImage(named: "comment")
    }
    
    let commentCountLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "0")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    init(reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupView()
        //        self.backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .white
        self.contentView.flex
            .width(UIScreen.main.bounds.width)
            .define {
                // 프로필, 작성 시간
                $0.addItem(profileAndDateView)
                    .direction(.row)
                    .justifyContent(.spaceBetween)
                    .define {
                        $0.addItem(profileView).direction(.row).define {
                            $0.addItem(profileImageView)
                            $0.addItem(usernameLabel)
                                .marginLeft(11)
                        }
                        
                        $0.addItem(writeDateLabel).alignContent(.end)
                    }
                
                // 호선, 카테고리
                $0.addItem(badgeView)
                    .direction(.row)
                    .marginTop(11)
                    .define {
                        $0.addItem(lineBadge)
                        $0.addItem(categoryBadge)
                    }
                
                // 제목
                $0.addItem(titleLabel).marginTop(16)
                
                // 내용
                $0.addItem(contentLabel).marginTop(8)
                
                // 댓글
                $0.addItem(commnetView)
                    .alignContent(.center)
                    .marginTop(28)
                    .direction(.row)
                    .define {
                        $0.addItem(commentIamgeView)
                        $0.addItem(commentCountLabel)
                    }
            }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.contentView.pin.all()
        
        self.flex.layout(mode: .adjustHeight)
        self.contentView.flex.layout(mode: .adjustHeight)
        
        self.contentView.flex.padding(20, 24)
    }
}
