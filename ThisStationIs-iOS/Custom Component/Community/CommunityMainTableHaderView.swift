//
//  CommunityMainTableHaderView.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/21.
//

import UIKit

class CommunityMainTableHaderView: UIView {
    
    
    
    let categoryView = UIView().then {
        $0.backgroundColor = .white
    }
    
   
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        
    }
}
