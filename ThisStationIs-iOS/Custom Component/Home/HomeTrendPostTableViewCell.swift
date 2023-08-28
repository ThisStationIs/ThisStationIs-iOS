//
//  HomeTrendPostTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/07/13.
//

import UIKit

class HomeTrendPostTableViewCell: UITableViewCell {
    
    lazy var scrollView = UIScrollView().then {
        $0.delegate = self
        $0.frame = .init(x: 0, y: 0, width: UIScreen.width, height: 232)
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
//        $0.isPagingEnabled = true
    }
    
    var postViewArray: [UIView] = []
    
    let contentViewWidth = UIScreen.width - 24 - 16 - 24
    var postData: [PostModel]?
    
    init(reuseIdentifier: String?, postDataArray: [PostModel]) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.postData = postDataArray
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.addSubview(scrollView)
        setupScrollContent()
    }
    
    private func setupScrollContent() {
        guard let postData = postData else { return }
        for i in 0..<10 {
            let trendPostView = setupScrollContentView(postData: postData[i])
            trendPostView.tag = i
            
            self.postViewArray.append(trendPostView)
        }
        
        for i in 0..<postViewArray.count {
            scrollView.addSubview(postViewArray[i])
            
            if i == 0 {
                postViewArray[i].snp.makeConstraints {
                    $0.leading.equalToSuperview().inset(24)
                    $0.top.bottom.equalToSuperview()
                    $0.width.equalTo(contentViewWidth)
                }
            } else if i == postViewArray.count - 1{
                postViewArray[i].snp.makeConstraints {
                    $0.leading.equalTo(postViewArray[i-1].snp.trailing).offset(16)
                    $0.top.bottom.equalToSuperview()
                    $0.trailing.equalToSuperview().inset(24)
                    $0.width.equalTo(contentViewWidth)
                }
            } else {
                postViewArray[i].snp.makeConstraints {
                    $0.leading.equalTo(postViewArray[i-1].snp.trailing).offset(16)
                    $0.top.bottom.equalToSuperview()
                    $0.width.equalTo(contentViewWidth)
                }
            }
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(230)
        }
        
        self.contentView.snp.makeConstraints {
            $0.top.equalTo(scrollView.snp.top)
            $0.bottom.equalTo(scrollView.snp.bottom)
            $0.edges.equalToSuperview()
        }
    }
}

extension HomeTrendPostTableViewCell {
    func setupScrollContentView(postData: PostModel) -> UIView {
        
        let trendPostView = UIView()
        trendPostView.backgroundColor = AppColor.setupColor(.componentTextbox)
        trendPostView.layer.cornerRadius = 15
        
        let profileImageView = UIImageView().then {
            $0.frame = .init(x: 0, y: 0, width: 32, height: 32)
            $0.image = UIImage(named: "profile")
        }
        
        let usernameLabel = UILabel().then {
            $0.attributedText = .attributeFont(font: .body16, text: postData.userName)
        }
        
        let writeDateLabel = UILabel().then {
            $0.attributedText = .attributeFont(font: .body14, text: postData.writeDate)
            $0.textColor = AppColor.setupColor(.textSub)
        }
        
        let lineBadge = BadgeView().then {
            $0.text = .attributeFont(font: .content, text: postData.subway)
            $0.textColor = AppColor.setupLineColor(postData.subway)
            $0.backgroundColor = AppColor.setupLineColor(postData.subway).withAlphaComponent(0.1)
        }
        
        let categoryBadge = BadgeView().then {
            $0.text = .attributeFont(font: .content, text: postData.category)
            $0.textColor = AppColor.setupColor(.textSub)
            $0.backgroundColor = AppColor.setupColor(.textSub).withAlphaComponent(0.1)
        }
        
        let titleLabel = UILabel().then {
            $0.attributedText = .attributeFont(font: .heading16, text: postData.title)
            $0.numberOfLines = 1
        }
        
        let contentLabel = UILabel().then {
            $0.attributedText = .attributeFont(font: .body16, text: postData.content)
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
            trendPostView.addSubview($0)
        }
        
        [
            commentIamgeView,
            commentCountLabel
        ].forEach {
            commentView.addSubview($0)
        }
        
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
        
        return trendPostView
    }
}

extension HomeTrendPostTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //
    }
}
