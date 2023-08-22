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
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.register(MyTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "MyTableViewHeader")
        $0.register(MyTitleCell.self, forCellReuseIdentifier: "MyTitleCell")
        $0.register(MyMenuCell.self, forCellReuseIdentifier: "MyMenuCell")
    }
    
    private let myActivityMenus: [String] = ["내 활동", "내가 쓴 글", "내가 쓴 댓글"]
    private let thisStationIsMenus: [String] = ["이번역은", "문의하기"]
    
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
        view.backgroundColor = AppColor.setupColor(.primaryNormal)
        view.addSubview(myTableView)
        if #available(iOS 15, *) {
            myTableView.sectionHeaderTopPadding = 0
        }
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    private func setupLayout() {
        myTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupNavi() {
        navigationController?.navigationBar.backgroundColor = AppColor.setupColor(.primaryNormal)
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

extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyTableViewHeader") as! MyTableViewHeader
        return section == 0 ? header : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 88 : 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        let titleCell = tableView.dequeueReusableCell(withIdentifier: "MyTitleCell") as! MyTitleCell
        titleCell.setupTitle(title: section == 0 ? myActivityMenus[0] : thisStationIsMenus[0])
        titleCell.version = section == 0 ? .noVersion : .isVersion
        
        let menuCell = tableView.dequeueReusableCell(withIdentifier: "MyMenuCell") as! MyMenuCell
        menuCell.setupTitle(title: section == 0 ? myActivityMenus[row] : thisStationIsMenus[row])
        
        return row == 0 ? titleCell : menuCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? myActivityMenus.count : thisStationIsMenus.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        return row == 0 ? 45 : 40
    }
    
}
