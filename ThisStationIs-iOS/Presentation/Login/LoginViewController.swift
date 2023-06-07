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
        $0.backgroundColor = .white
    }
    
    let leftSideView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.primaryNormal)
    }
    
    let icon = UIImageView().then {
        $0.image = UIImage(named: "logo")
    }
    
    let rightSideView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.primaryNormal)
    }
    
    let idInputView = InputView(label: "아이디", placeholder: "아이디를 입력해주세요.")
    
    let pwInputView = InputView(label: "비밀번호", placeholder: "비밀번호를 입력해주세요.").then {
        $0.setRightViewMode(type: .password)
    }
    
    let loginButton = MainButton().then {
        $0.setTitle("로그인", for: .normal)
    }
    
    let joinInButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(AppColor.setupColor(.primaryNormal), for: .normal)
        $0.titleLabel?.attributedText = .attributeFont(font: .label, text: "회원가입")
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
        view.backgroundColor = .white
        
        [
            iconView,
            idInputView,
            pwInputView,
            loginButton,
            joinInButton
        ].forEach {
            view.addSubview($0)
        }
        
        [
            leftSideView, icon, rightSideView
        ].forEach {
            iconView.addSubview($0)
        }
    }
    
    private func setupLayout(){
        iconView.pin.top(view.safeAreaInsets.top + 55)
            .width(view.frame.width).height(80)
        
        idInputView.pin
            .below(of: iconView)
            .horizontally(24).marginTop(40)
            .height(64)
        
        pwInputView.pin.below(of: idInputView)
            .below(of: idInputView)
            .horizontally(24).marginTop(40)
            .height(idInputView.frame.height)
        
        loginButton.pin.below(of: pwInputView)
            .horizontally(24).marginTop(30)
            .height(60)
        
        joinInButton.pin.below(of: loginButton).marginTop(24)
            .left(51)
            .width(60)
        
        setupIconViewLayout()
    }
    
    private func setupIconViewLayout(){
        leftSideView.pin
            .start(24)
            .center().vertically()
            .width(97).height(16)
        
        icon.pin.center().horizontally()
            .width(69).height(80)
        
        rightSideView.pin.end(24)
            .center().vertically()
            .width(97).height(16)
    }
}
