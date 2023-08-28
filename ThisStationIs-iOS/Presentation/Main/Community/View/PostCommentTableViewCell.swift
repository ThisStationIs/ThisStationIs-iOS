//
//  PostCommentTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/24.
//

import UIKit

class PostCommentTableViewCell: UITableViewCell {
    
    let containerView = UIView()
    
    let profileImageView = UIImageView().then {
        $0.frame = .init(x: 0, y: 0, width: 32, height: 32)
        $0.image = UIImage(named: "profile")
    }
    
    let usernameLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "행복한 바나나")
    }
    
    let menuButton = UIButton().then {
        $0.setImage(UIImage(named: "menu"), for: .normal)
    }
    
    let writeDateLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "23.03.09 17:37")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    let commentLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "여기 4호선 미아역에서 6번 출구로 나가면 베스킨라빈스 있는데 거기서 오른쪽으로 이동하면 골목 하나 나와요 그 골목 쭉 끝까지 들어가면 포장마차 하나 나오거든요? 그 포장 마차 기준으로 거기서 10분만 더 들어가면 그 맛있는 이자카야 하나 있어요! 이름은 기억이 안나는데 꽃 그림 그려져 있었던 거 같아요 아무튼 여기 맛있으니까 한 번 꼭 가보세요!")
        $0.numberOfLines = 0
    }
    
    init(reuseIdentifier: String?, commentData: CommentModel) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpData(commentData)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpData(_ commentData: CommentModel) {
        usernameLabel.attributedText = .attributeFont(font: .body14, text: commentData.userName)
        writeDateLabel.attributedText = .attributeFont(font: .body14, text: commentData.writeDate)
        commentLabel.attributedText = .attributeFont(font: .body14, text: commentData.comment)
    }
    
    private func setUpView() {
        self.contentView.addSubview(containerView)
        
        [
            profileImageView,
            usernameLabel,
            menuButton,
            writeDateLabel,
            commentLabel,
        ].forEach {
            self.containerView.addSubview($0)
        }
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
            $0.height.width.equalTo(32)
        }
        
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
        }
        
        menuButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(-2)
            $0.trailing.equalToSuperview().inset(24)
            $0.width.height.equalTo(24)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(usernameLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        writeDateLabel.snp.makeConstraints {
            $0.top.equalTo(commentLabel.snp.bottom).offset(4)
            $0.leading.equalTo(usernameLabel.snp.leading)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(26)
        }
        
        containerView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.bottom.equalTo(writeDateLabel.snp.bottom).inset(-26)
            $0.edges.equalToSuperview()
        }
    }
}
