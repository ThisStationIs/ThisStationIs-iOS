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
        setupRightBarButtonItem()
    }
    
    private func setupLeftBarButtonItem() {
        let leftBarItemForTitle = UIBarButtonItem(title: "나의 프로필", style: .plain, target: nil, action: nil)
        leftBarItemForTitle.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)
        ], for: .normal)
        navigationItem.leftBarButtonItem = leftBarItemForTitle
    }
    
    private func setupRightBarButtonItem() {
        guard let originalImage = UIImage(named: "setting") else { return }
        
        let resizedImage = originalImage.resized(to: CGSize(width: 24, height: 24))
        
        let tintedImage = resizedImage?.withTintColor(.white, renderingMode: .alwaysOriginal)

        let rightBarItemForSetting = UIBarButtonItem(image: tintedImage, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightBarItemForSetting
    }
    
    
}

