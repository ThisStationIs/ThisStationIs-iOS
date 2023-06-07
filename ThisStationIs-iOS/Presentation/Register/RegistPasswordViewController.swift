//
//  RegistPasswordViewController.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/06/07.
//

import UIKit

import FlexLayout

class RegistPasswordViewController: UIViewController {
    let mainDescriptionLabel = UILabel().then {
        $0.textColor = AppColor.setupColor(.textMain)
        $0.attributedText = .attributeFont(font: .heading24, text: "로그인에 사용할\n비밀번호를 입력해주세요.")
        $0.numberOfLines = 0
    }
    
    let passwordInputView = InputView(label: "비밀번호", placeholder: "비밀번호를 입력해주세요.").then {
        $0.setRightViewMode(type: .password)
    }
    
    let checkPasswordInputView = InputView(label: "비밀번호 확인", placeholder: "비밀번호를 다시 입력해주세요.").then {
        $0.setRightViewMode(type: .password)
    }
    
    let bottomButton = MainButton().then {
        $0.setTitle("다음", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayout()
    }
}

extension RegistPasswordViewController {
    private func setupView(){
        view.backgroundColor = .white
        
        [
            mainDescriptionLabel,
            passwordInputView,
            checkPasswordInputView,
            bottomButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayout(){
        mainDescriptionLabel.sizeToFit()
        mainDescriptionLabel.pin.top(view.safeAreaInsets.top + 73)
            .left(24)
        
        passwordInputView.pin
            .below(of: mainDescriptionLabel)
            .horizontally(24).marginTop(40)
            .height(64)
        
        checkPasswordInputView.pin
            .below(of: passwordInputView)
            .horizontally(24).marginTop(8)
            .height(passwordInputView.frame.height)
        
        bottomButton.pin.bottom(view.safeAreaInsets.bottom + 34)
            .horizontally(24)
            .height(60)
    }
}
