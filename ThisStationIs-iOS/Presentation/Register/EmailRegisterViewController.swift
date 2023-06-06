//
//  EmailRegisterViewController.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/04/24.
//

import UIKit

class EmailRegisterViewController: UIViewController {
    
    let emailFlexContainer: UIView = UIView()
    
    let titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading24, text: "로그인에 사용할 이메일 형식의\n아이디를 입력해주세요.", lineHeight: 33.6)
        $0.numberOfLines = 2
    }
    
    let emailTextField = InputView(label: "이메일", placeholder: "이메일 형식으로 입력해주세요.").then {
        $0.errorText = "이메일 형식이 아니에요."
    }
    
    lazy var nextButton = UIButton().then {
        $0.backgroundColor = UIColor(named: ColorSet.primary.name)
        $0.setTitle("다음", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(selectNextButton), for: .touchUpInside)
    }
    
  
    
    @objc func selectNextButton() {
//        bottomSheetView.alpha = 1.1
//        bottomSheetView.showBottomSheet()
        let bottomSheetView = BottomSheetView()
        bottomSheetView.showBottomSheet()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        self.view.addSubview(emailFlexContainer)
        
        emailFlexContainer.flex
            .paddingTop(15)
            .justifyContent(.spaceBetween)
            .define {
                
            $0.addItem().direction(.column).padding(.init(top: 0, left: 24, bottom: 10, right: 24)).define {
                $0.addItem(titleLabel)
                $0.addItem(emailTextField)
                    .marginTop(20)
            }
            
            $0.addItem().padding(.init(top: 0, left: 24, bottom: 0, right: 24)).define {
                $0.addItem(nextButton).height(60)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailFlexContainer.pin.all(view.pin.safeArea)
        emailFlexContainer.flex.layout()
    }
}
