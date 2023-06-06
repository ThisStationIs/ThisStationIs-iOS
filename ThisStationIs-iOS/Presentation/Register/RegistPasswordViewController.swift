//
//  RegistPasswordViewController.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/06/07.
//

import UIKit

class RegistPasswordViewController: UIViewController {
    let mainDescriptionLabel = UILabel().then {
        $0.text = "로그인에 사용할\n비밀번호를 입력해주세요."
    }
    
    let passwordInputView = InputView(label: "비밀번호", placeholder: "비밀번호를 입력해주세요.").then {
        $0.setRightViewMode(type: .auth)
    }
    
    let checkPasswordInputView = InputView(label: "비밀번호 확인", placeholder: "비밀번호를 다시 입력해주세요.").then {
        $0.setRightViewMode(type: .auth)
    }
}
