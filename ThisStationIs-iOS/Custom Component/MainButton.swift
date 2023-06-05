//
//  MainButton.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/04/17.
//

import UIKit

class MainButton: UIButton {
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? .green : .lightGray
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupAttribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAttribute(){
        layer.cornerRadius = 20
        self.backgroundColor = AppColor.setupColor(.primaryNormal)
        
        setTitleColor(.white, for: .normal)
    }
}

