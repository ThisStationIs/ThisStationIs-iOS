//
//  CheckButtonWithText.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/06/12.
//

import UIKit

class CheckButtonWithText: UIView {
    
    let checkButton = UIButton().then {
        $0.frame = .init(x: 0, y: 0, width: 24, height: 24)
        $0.setImage(UIImage(named: "check_off"), for: .normal)
    }
    
    let checkLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "전체동의")
    }
    
    var isCheck: Bool = false {
        didSet {
            isCheck ? checkButton.setImage(UIImage(named: "check_on"), for: .normal) : checkButton.setImage(UIImage(named: "check_off"), for: .normal)
        }
    }
    
    var setText: NSAttributedString = NSAttributedString() {
        didSet {
            checkLabel.attributedText = setText
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        self.flex.direction(.row).define {
            $0.addItem(checkButton)
            $0.addItem(checkLabel).marginLeft(8)
        }
    }
    
    func addTarget(_ target: Any?, action: Selector) {
        checkButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.flex.layout(mode: .adjustHeight)
    }
}
