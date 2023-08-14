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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavi()
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
    
    private func setupNavi() {
        setupLeftBarButtonItem()
    }
    
    private func setupLeftBarButtonItem(){
        let leftTitleBarItem = UIBarButtonItem(title: "나의 프로필", style: .plain, target: nil, action: nil)
        leftTitleBarItem.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)
        ], for: .normal)
        navigationItem.leftBarButtonItem = leftTitleBarItem
    }
}
