//
//  HomeTableHeaderView.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/07/13.
//

import UIKit

class HomeTableHeaderView: UIView {
    let congestionView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.componentTextbox)
        $0.layer.cornerRadius = 15
    }
    
    let congestionEmojiLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body18, text: "🤔")
        $0.textAlignment = .center
    }
    
    let congestionTitleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "어느칸에 타야할까?")
        $0.textAlignment = .center
    }
    
    let congestionDesscriptionLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "지하철 혼잡도 확인 >")
        $0.textColor = AppColor.setupColor(.textSub)
        $0.textAlignment = .center
    }
    
    let firstLastTrainView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.componentTextbox)
        $0.layer.cornerRadius = 15
    }
    
    let firstLastTrainEmojiLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body18, text: "🚈")
        $0.textAlignment = .center
    }
    
    let firstLastTrainTitleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "언제 타야 갈 수 있지?")
        $0.textAlignment = .center
    }
    
    let firstLastTrainDesscriptionLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "첫·막차 확인하기 >")
        $0.textColor = AppColor.setupColor(.textSub)
        $0.textAlignment = .center
    }
    
    var halfViewWidth = (UIScreen.width - 24 - 24 - 16) / 2
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // view
        [
            congestionView,
            firstLastTrainView
        ].forEach {
            self.addSubview($0)
        }
        
        // congestionView : 지하철 혼잡도
        [
            congestionEmojiLabel,
            congestionTitleLabel,
            congestionDesscriptionLabel
        ].forEach {
            congestionView.addSubview($0)
        }
        
        // firstLastTrain : 첫, 막차
        [
            firstLastTrainEmojiLabel,
            firstLastTrainTitleLabel,
            firstLastTrainDesscriptionLabel
        ].forEach {
            firstLastTrainView.addSubview($0)
        }
        
        setupLayout()
    }
    
    private func setupLayout() {
        congestionEmojiLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        congestionTitleLabel.snp.makeConstraints {
            $0.top.equalTo(congestionEmojiLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        
        congestionDesscriptionLabel.snp.makeConstraints {
            $0.top.equalTo(congestionTitleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }
        
        congestionView.snp.makeConstraints {
            $0.top.equalTo(congestionEmojiLabel.snp.top).inset(-16)
            $0.bottom.equalTo(congestionDesscriptionLabel.snp.bottom).inset(-16)
            $0.width.equalTo(halfViewWidth)
            $0.leading.equalToSuperview().inset(24)
            $0.top.equalToSuperview().inset(16)
        }
        
        firstLastTrainEmojiLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        firstLastTrainTitleLabel.snp.makeConstraints {
            $0.top.equalTo(firstLastTrainEmojiLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        
        firstLastTrainDesscriptionLabel.snp.makeConstraints {
            $0.top.equalTo(firstLastTrainTitleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }
        
        firstLastTrainView.snp.makeConstraints {
            $0.top.equalTo(firstLastTrainEmojiLabel.snp.top).inset(-16)
            $0.bottom.equalTo(firstLastTrainDesscriptionLabel.snp.bottom).inset(-16)
            $0.width.equalTo(halfViewWidth)
            $0.leading.equalTo(congestionView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(24)
            $0.top.equalToSuperview().inset(16)
        }
    }
}
