//
//  LineCollectionViewCell.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/06/07.
//

import UIKit

class LineCollectionViewCell: UICollectionViewCell {
    let lineNamelabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .content, text: "호선")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LineCollectionViewCell {
    private func setupView(){
        contentView.layer.cornerRadius = 15
        contentView.addSubview(lineNamelabel)
    }
    
    private func setupLayout(){
        lineNamelabel.sizeToFit()
        lineNamelabel.pin
            .center()
    }
    
    func setupAttribute(bgColor: UIColor, txtColor: UIColor) {
        lineNamelabel.textColor = txtColor
        contentView.backgroundColor = bgColor
    }
}
