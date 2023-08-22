//
//  RegisterTermsView.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/06/12.
//

import UIKit

class RegisterTermsView: UIView {
    
    let titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading24, text: "이번 역은 서비스 약관에\n동의해주세요!")
        $0.numberOfLines = 2
    }
    
    lazy var allAgreeButton = CheckButtonWithText().then {
        $0.addTarget(self, action: #selector(selectAllAgreeButton))
        $0.setText = .attributeFont(font: .body16, text: "전체동의")
    }
    
    let separatorView = UIView().then {
        $0.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width - 48, height: 1)
        $0.backgroundColor = AppColor.setupColor(.componentDivider)
    }
    
    var termsButtonView = UIView().then {
        $0.backgroundColor = .red
    }
    
    var terms1Button = CheckButtonWithText().then {
        $0.setText = .attributeFont(font: .body14, text: "이용약관 동의")
    }
    
    var terms2Button = CheckButtonWithText().then {
        $0.setText = .attributeFont(font: .body14, text: "개인정보 수집 및 동의")
    }
    
    var terms3Button = CheckButtonWithText().then {
        $0.setText = .attributeFont(font: .body14, text: "본인 확인 서비스 이용 동의")
    }
    
    var terms4Button = CheckButtonWithText().then {
        $0.setText = .attributeFont(font: .body14, text: "뉴스레터 및 마케팅 정보 수신 동의")
    }
    
    lazy var doneButton = MainButton().then {
        $0.setAttributedTitle(.attributeFont(font: .body16, text: "확인"), for: .normal)
        $0.addTarget(self, action: #selector(selectDoneButton), for: .touchUpInside)
    }
    
    var closeAction: (() -> ())?
    
    @objc func selectDoneButton() {
        if let closeAction = closeAction {
            closeAction()
        }
    }
    
    @objc func selectAllAgreeButton() {
        print("in")
        allAgreeButton.isCheck = allAgreeButton.isCheck ? false : true
    }
    
    init() {
        super.init(frame: .zero)
//        self.backgroundColor = .red
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.flex.padding(.init(top: 0, left: 24, bottom: 0, right: 24)).direction(.column).define {
            $0.addItem(titleLabel)
            $0.addItem(allAgreeButton)
                .paddingTop(24)
            $0.addItem(separatorView)
                .marginTop(24)
            $0.addItem(termsButtonView).marginTop(24).define {
                $0.addItem(terms1Button)
                $0.addItem(terms2Button).paddingTop(24)
                $0.addItem(terms3Button).paddingTop(24)
                $0.addItem(terms4Button).paddingTop(24)
            }
            
            $0.addItem(doneButton)
                .height(48)
                .marginTop(24)
        }
    }
    
    override func layoutSubviews() {
        
//        allAgreeButton.pin.after(of: titleLabel)
        
        self.flex.layout(mode: .adjustHeight)
        
    }
}
