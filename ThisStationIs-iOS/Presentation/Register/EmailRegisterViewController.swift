//
//  EmailRegisterViewController.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/04/24.
//

import UIKit

class EmailRegisterViewController: UIViewController {
    
    let emailFlexContianer: UIView = UIView()
    
    let titleLabel = UILabel().then {
        $0.text = "로그인에 사용할 이메일 형식의\n아이디를 입력해주세요."
        $0.numberOfLines = 2
        $0.font = UIFont.systemFont(ofSize: 24, weight: .medium)
    }
    
    let emailLabel = UILabel().then {
        $0.text = "이메일"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    let emailTextField = UITextField().then {
        $0.placeholder = "이메일 형식으로 입력해주세요."
    }
    
    let separatorView = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    let nextButton = UIButton().then {
        $0.backgroundColor = .systemGreen
        $0.setTitle("다음", for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        self.view.addSubview(emailFlexContianer)
        
        emailFlexContianer.flex
            .paddingTop(15)
            .justifyContent(.spaceBetween)
            .define {
                
            $0.addItem().direction(.column).padding(.init(top: 0, left: 24, bottom: 10, right: 24)).define {
                $0.addItem(titleLabel)
                
                $0.direction(.column).define {
                    $0.addItem(emailLabel).marginTop(49)
                    $0.addItem(emailTextField).paddingTop(16).height(38)
                    $0.addItem(separatorView).height(1)
                }
            }
            
            $0.addItem().padding(.init(top: 0, left: 24, bottom: 0, right: 24)).define {
                $0.addItem(nextButton).height(60)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailFlexContianer.pin.all(view.pin.safeArea)
        emailFlexContianer.flex.layout()
    }
}
