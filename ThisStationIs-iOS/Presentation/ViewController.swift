//
//  ViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/04/17.
//

import UIKit

class ViewController: UIViewController {

    var testContainerView = UIView()
    
    let inputTextField = InputView(label: "레이블").then {
        $0.setRightViewMode(type: .auth)
        $0.errorText = "에러 텍스트"
    }
    
    lazy var testButton = UIButton().then {
        $0.setAttributedTitle(.attributeFont(font: .heading24, text: "test"), for: .normal)
        $0.addTarget(self, action: #selector(selectTestButton), for: .touchUpInside)
        $0.backgroundColor = .red
    }
    
    var testBadgeView = BadgeView(size: .small).then {
        $0.text = .attributeFont(font: .content, text: "1호선")
        $0.textColor = .systemBlue
        $0.backgroundColor = .systemBlue.withAlphaComponent(0.5)
    }
    
    @objc func selectTestButton() {
        inputTextField.isError = inputTextField.isError ? false : true
        testContainerView.flex.layout()
        
        self.navigationController?.pushViewController(EmailRegisterViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.view.addSubview(testContainerView)
    
        
        testContainerView.flex.direction(.column).define {
            $0.addItem(inputTextField)
            $0.addItem(testButton).height(60)
            $0.addItem(testBadgeView).marginTop(30).width(53)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        testContainerView.pin.all(view.pin.safeArea)
        testContainerView.flex.layout(mode: .adjustHeight)
    }
}
