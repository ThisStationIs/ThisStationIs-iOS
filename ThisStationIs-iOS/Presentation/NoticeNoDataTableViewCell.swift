//
//  NoticeNoDataTableViewCell.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/07/05.
//

import UIKit
import Then

class NoticeNoDataTableViewCell: UITableViewCell {
    private let noticeLabel = UILabel().then {
        $0.textColor = AppColor.setupColor(.textSub)
        $0.font = .systemFont(ofSize: 16)
        $0.text = "test"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
//        contentView.backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.pin.all()
        contentView.flex.layout()
    }
}

extension NoticeNoDataTableViewCell {
    private func setupView(){
        contentView.addSubview(noticeLabel)
    }
    
    private func setupLayout(){
        contentView.flex.direction(.column)
            .justifyContent(.center).alignItems(.center).define { flex in
            flex.addItem(noticeLabel)
        }
    }
    
    func setupText(text: String){
        noticeLabel.text = text
    }
}
