//
//  MyViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/04/17.
//

import UIKit
import Then

class MyViewController: UIViewController {
    private let myTableView = UITableView().then {
        $0.backgroundColor = AppColor.setupColor(.primaryNormal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
}

extension MyViewController {
    private func setupView() {
        view.addSubview(myTableView)
    }
    
    private func setupLayout() {
        myTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
