//
//  AuthNumberViewController.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/06/09.
//

import UIKit

class AuthNumberViewController: UIViewController {
    
    let authFlexContainer: UIView = UIView()

    let titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading24, text: "이메일로 발송된\n인증번호 6자리를 입력해주세요.")
        $0.numberOfLines = 2
    }
    
    let authTextField = InputView(label: "인증번호", placeholder: "인증번호 6자리").then {
        $0.setRightViewMode(type: .auth)
    }
    
    lazy var nextButton = MainButton().then {
        $0.setTitle("다음", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(authFlexContainer)
        
        authFlexContainer.flex
            .paddingTop(15)
            .justifyContent(.spaceBetween)
            .define {
                
            $0.addItem()
                    .direction(.column)
                    .padding(.init(top: 0, left: 24, bottom: 10, right: 24))
                    .define {
                $0.addItem(titleLabel)
                $0.addItem(authTextField)
                    .paddingTop(48)
            }
            
            $0.addItem().padding(.init(top: 0, left: 24, bottom: 0, right: 24)).define {
                $0.addItem(nextButton).height(60)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        authFlexContainer.pin.all(view.pin.safeArea)
        authFlexContainer.flex.layout()
    }
}
