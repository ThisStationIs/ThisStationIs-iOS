//
//  TextView.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/09/01.
//

import UIKit

class TextView: UITextView {
    let placeholderLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.attributedText = .attributeFont(font: .body16, text: "선택하신 태그와 관련된 글로 입력해주세요.\n댓글이 있는 경우 수정이 불가능합니다.")
        $0.textColor = AppColor.setupColor(.textTeritory)
    }
    
    init() {
        super.init(frame: .zero, textContainer: .none)
        
        self.addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard let text = textView.text else { return }
        textView.attributedText = .attributeFont(font: .body16, text: text)
        placeholderLabel.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let text = textView.text else { return }
        placeholderLabel.isHidden = text.isEmpty ? false : true
    }
}
