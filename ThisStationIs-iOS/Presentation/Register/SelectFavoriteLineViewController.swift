//
//  SelectFavoriteLineViewController.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/06/07.
//

import UIKit

class SelectFavoriteLineViewController: UIViewController {
    let mainDescriptionLabel = UILabel().then {
        $0.textColor = AppColor.setupColor(.textMain)
        $0.attributedText = .attributeFont(font: .heading24, text: "평소 이용하시는\n지하철 호선을 선택해주세요.")
        $0.numberOfLines = 0
    }
    
    let bottomButton = MainButton().then {
        $0.setTitle("가입 완료", for: .normal)
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

extension SelectFavoriteLineViewController {
    private func setupView(){
        view.backgroundColor = .white
        
        [
            mainDescriptionLabel,
            bottomButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayout(){
        mainDescriptionLabel.sizeToFit()
        mainDescriptionLabel.pin.top(view.safeAreaInsets.top + 73)
            .left(24)
        
        bottomButton.pin.bottom(view.safeAreaInsets.bottom + 34)
            .horizontally(24)
            .height(60)
    }
}
