//
//  AppPopUpViewController.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/08/25.
//

import UIKit

import SnapKit
import Then

enum AppPopUpType {
    case oneButton
    case oneButtonTitleOnly
    case twoButton
    case twoButtonBodyOnly
}

class AppPopUpViewController: UIViewController {
    let modalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 24
        $0.backgroundColor = .white
        $0.alignment = .center
    }
    
    let titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading16, text: "")
        $0.numberOfLines = 0
    }
    
    let bodyLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "")
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    let subButton = UIButton().then {
        $0.setTitleColor(AppColor.setupColor(.textSub), for: .normal)
    }
    
    let mainButton = UIButton().then {
        $0.setTitleColor(AppColor.setupColor(.primaryNormal), for: .normal)
    }

    var type: AppPopUpType = .oneButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBlurView()
        setupView()
        setupLayout()
    }
    
}

extension AppPopUpViewController {
    private func setupView() {
        switch type {
        case .oneButton:
            [
                titleLabel,
                bodyLabel,
                mainButton
            ].forEach {
                modalStackView.addArrangedSubview($0)
            }
        case .oneButtonTitleOnly:
            [
                titleLabel,
                mainButton
            ].forEach {
                modalStackView.addArrangedSubview($0)
            }
        case .twoButton:
            [
                titleLabel,
                bodyLabel
            ].forEach {
                modalStackView.addArrangedSubview($0)
            }
        case .twoButtonBodyOnly:
            [
                bodyLabel
            ].forEach {
                modalStackView.addArrangedSubview($0)
            }
        }
    }
    
    private func setupBlurView() {
        let blurEffet = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffet)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.8
        
        view.addSubview(blurEffectView)
        view.addSubview(modalStackView)
    }
    
    private func setupLayout() {
        modalStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
                .inset(36)
            $0.height.equalTo(100)
        }
    }
    
    func setupTitle(title: String) {
        titleLabel.text = title
    }
    
    func setupBody(body: String) {
        bodyLabel.text = body
    }
    
    func setupMainButtonColor(color: UIColor) {
        mainButton.setTitleColor(color, for: .normal)
    }
}
