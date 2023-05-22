//
//  LoginViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/04/17.
//

import UIKit
import Then

import FlexLayout

class LoginViewController: UIViewController {
    
    let iconView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.statusNegative)
    }
    
    let idInputView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.statusNegative)
    }
//    = InputView(label: "아이디").then {
//        $0.backgroundColor = AppColor.setupColor(.textMain)
//    }
    
    let pwInputView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.statusNegative)
    }
    
    let loginButton = MainButton().then {
        $0.setTitle("로그인", for: .normal)
    }
    
    let joinInButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
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


extension LoginViewController {
    private func setupView(){
        view.backgroundColor = AppColor.setupColor(.statusPositive)
        
        [
            iconView,
            idInputView,
            pwInputView,
            loginButton,
            joinInButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayout(){
        iconView.pin.top().marginTop(view.safeAreaInsets.top).width(view.frame.width).height(80)
        idInputView.pin.below(of: iconView).marginTop(40)
            .horizontally(24)
            .height(64)
        pwInputView.pin.below(of: idInputView).marginTop(40)
            .horizontally(24)
            .height(idInputView.frame.height)
        loginButton.pin.below(of: pwInputView).marginTop(30)
            .horizontally(24)
            .height(60)
        joinInButton.pin.below(of: loginButton).marginTop(24)
            .left(51)
            .width(50)
    }
}
