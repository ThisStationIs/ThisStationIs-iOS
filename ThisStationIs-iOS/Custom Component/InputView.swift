//
//  TextField.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/05/15.
//

import UIKit

/**
    커스텀 텍스트 필드
 
     - Parameters:
        - label: 기본 텍스트 필드 라벨, 필수
        - placeholder: 텍스트 필드 placeholder, 옵셔널
 
    **에러 텍스트 사용 방법**
    - 에러 텍스트 설정 시 errorText로 설정
    - 에러 텍스트 사용 시 isError 호출
 
    **setRightViewMode 사용 방법**
    - password : 비밀번호 표시 버튼
    - auth : 시간 레이블, 전송 버튼
    - default : 기본

*/
class InputView: UIView {
    
    /* 텍스트 필드 유형
     1. textfield, label
     2. textfield, label, error text
     3. textfield, label, button
     4. textfield, hintView, button
     */
    
    enum TextFieldType {
        case `default`
        case password
        case auth
    }
    
    private var inputLabel = UILabel().then {
        $0.text = "label"
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    
    private var textField = TextField().then {
        $0.placeholder = "Text"
    }
    
    private var errorTextLabel = UILabel().then {
        $0.text = "error Text"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = AppColor.setupColor(.statusNegative)
    }
    
    private lazy var showPasswordButton = UIButton().then {
        $0.frame = .init(x: 0, y: 0, width: 24, height: 24)
        $0.setImage(UIImage(named: "eye"), for: .normal)
        $0.addTarget(self, action: #selector(selectShowPasswordButton), for: .touchUpInside)
    }
    
    private var timeLabel = UILabel().then {
        $0.text = "mm:ss"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    private var sendButton = UIButton().then {
        $0.setTitle("TEXT", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor(AppColor.setupColor(.primaryNormal), for: .normal)
        $0.backgroundColor = AppColor.setupColor(.statusNegative).withAlphaComponent(0.1)
        $0.layer.cornerRadius = 32 / 2
    }
    
    var isError: Bool = false {
        didSet {
            errorTextLabel.flex.display(isError ? .flex : .none)
            textField.isError = isError
        }
    }
    
    var errorText: String = "" {
        didSet {
            errorTextLabel.text = errorText
        }
    }
    
    @objc func selectShowPasswordButton() {
        textField.isSecureTextEntry = textField.isSecureTextEntry ? false : true
    }

    /// 텍스트 필드
    init(label: String, placeholder: String = "") {
        super.init(frame: .zero)
        setUI()
        
        inputLabel.text = label
        textField.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.flex
            .padding(16)
            .define {
                $0.addItem(inputLabel)
                $0.addItem(textField)
                $0.addItem(errorTextLabel)
                    .display(isError ? .flex : .none)
                    .marginTop(8)
                    .markDirty()
            }
    }
    
    func setErrorText() {
        
    }
    
    func setRightViewMode(type: TextFieldType = .default) {
        let rightView = UIView()
        
        if type == .auth {
            textField.padding = .init(top: 8, left: 0, bottom: 8, right: 117)
//            rightView.flex.direction(.rowReverse).define {
//                $0.addItem(timeLabel).marginRight(8)
//                $0.addItem(sendButton)
//                    .paddingHorizontal(22)
//                    .paddingVertical(4)
//            }
//            self.flex.addItem(rightView).height(32)
        } else if type == .password {
            rightView.frame = .init(x: 0, y: 0, width: 24, height: 24)
            rightView.addSubview(showPasswordButton)
            textField.isSecureTextEntry = true
            textField.padding = .init(top: 8, left: 0, bottom: 8, right: 24)
        } else {
          
        }
        
        textField.rightView = rightView
        textField.rightViewMode = .always
        
    }
    
    private func authenticationViewMode() {
        
    }
    
    override func layoutSubviews() {
//        self.pin.all(self.pin.safeArea)
        self.flex.layout()
    }
}
