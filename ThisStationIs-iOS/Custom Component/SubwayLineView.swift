//
//  SubwayLineView.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/04.
//

import UIKit

class SubwayLineView: UIView {
    let circleView = UIView().then {
        $0.frame = .init(x: 0, y: 0, width: 20, height: 20)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 20 / 2
    }
    
    let lineLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .content, text: "7")
        $0.textColor = .white
    }
    
    let stationLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "양재시민의숲역")
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        self.backgroundColor = AppColor.setupColor(.componentTextbox)
        self.layer.cornerRadius = 38 / 2
        
        [
            circleView,
            stationLabel
        ].forEach {
            self.addSubview($0)
        }
        
        circleView.addSubview(lineLabel)
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        circleView.snp.makeConstraints {
            $0.height.width.equalTo(20)
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(12)
        }
        
        lineLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        stationLabel.snp.makeConstraints {
            $0.centerY.equalTo(circleView)
            $0.leading.equalTo(circleView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(12)
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(38)
            $0.leading.equalTo(circleView.snp.leading).inset(-12)
            $0.trailing.equalTo(stationLabel.snp.trailing).inset(-12)
        }
    }
}
