//
//  SelectTagTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by Muzlive_Player on 2023/08/31.
//

import UIKit

class SelectTagTableViewCell: UITableViewCell {
    private let titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading16, text: "태그 선택")
    }
    
    let tagContentView = UIView()
    
    var tagButtonArray: [UIButton] = []
    
    let tagTitleArray: [String] = ["분실물", "연착정보", "사건사고", "알쓸신잡", "질문", "기타"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectTagTableViewCell {
    private func setupView() {
        [
            titleLabel,
            tagContentView
        ].forEach {
            contentView.addSubview($0)
        }
        
        // tag 뷰 만들기
        for i in 0..<tagTitleArray.count {
            let tagButton = UIButton()
            tagButton.layer.cornerRadius = 32 / 2
            tagButton.layer.masksToBounds = true
            tagButton.layer.borderWidth = 1
            tagButton.layer.borderColor = AppColor.setupColor(.textTeritory).cgColor
            tagButton.tag = i
//            tagButton.addTarget(self, action: #selector(selectLineButton), for: .touchUpInside)
            
            let tagLabel = UILabel()
            tagLabel.attributedText = .attributeFont(font: .content, text: tagTitleArray[i])
            tagLabel.textColor = AppColor.setupColor(.textTeritory)
            tagButton.addSubview(tagLabel)
            tagLabel.snp.makeConstraints {
                $0.top.bottom.equalToSuperview().inset(8)
                $0.leading.trailing.equalToSuperview().inset(12)
            }
            
            tagButton.snp.makeConstraints {
                $0.top.equalTo(tagLabel.snp.top).inset(-8)
                $0.bottom.equalTo(tagLabel.snp.bottom).inset(-8)
                $0.leading.equalTo(tagLabel.snp.leading).inset(-12)
                $0.trailing.equalTo(tagLabel.snp.trailing).inset(-12)
            }
            
            // 현재 선택되어있는 호선 표시
            //            for j in 0..<viewModel.selectedLineArray.count {
            //                // 이름이 같으면 선택 처리
            //                if viewModel.selectedLineArray[j] == lineNameArray[i] {
            //                    lineButton.isSelected = true
            //                    // 배경 색, 텍스트 색 변경
            //                    lineLabel.textColor = AppColor.setupLineColor(lineNameArray[i])
            //                    lineButton.backgroundColor = AppColor.setupLineColor(lineNameArray[i]).withAlphaComponent(0.1)
            //                    lineButton.layer.borderWidth = 0
            //                }
            //            }
            
            tagButtonArray.append(tagButton)
        }
    
        tagButtonArray.forEach { tagContentView.addSubview($0) }
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(8)
            $0.leading.equalToSuperview()
                .offset(24)
        }
        
        tagContentView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
                .offset(8)
            $0.leading.trailing.equalToSuperview()
                .inset(24)
            $0.bottom.equalToSuperview()
        }
        
        // 초기 시작 위치
        var positionX = 0.0
        var positionY = 0.0
        
        for i in 0..<tagTitleArray.count {
            tagButtonArray[i].snp.makeConstraints {
                $0.left.equalTo(positionX)
                $0.top.equalTo(positionY)
                $0.height.equalTo(32)
            }
            
            tagContentView.layoutIfNeeded()
            
            if tagButtonArray[i].frame.maxX + 16 > UIScreen.width {
                positionX = 0.0
                positionY = positionY + 32 + 16
                
                tagButtonArray[i].snp.remakeConstraints {
                    $0.left.equalTo(positionX)
                    $0.top.equalTo(positionY)
                    $0.height.equalTo(32)
                }
                
                tagContentView.layoutIfNeeded()
            }
            
            positionX = positionX + tagButtonArray[i].frame.size.width + 16
        }
    }
}
