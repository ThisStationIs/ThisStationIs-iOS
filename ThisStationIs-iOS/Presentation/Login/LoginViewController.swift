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
        iconView.pin.top(55).marginTop(view.safeAreaInsets.top).width(view.frame.width).height(80)
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
