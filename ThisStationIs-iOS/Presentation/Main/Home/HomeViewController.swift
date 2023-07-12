//
//  HomeViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/04/17.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeTableHeaderView = HomeTableHeaderView().then {
        $0.frame = .init(x: 0, y: 0, width: UIScreen.width, height: 129)
        $0.backgroundColor = .white
    }
    
    lazy var homeTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        $0.estimatedRowHeight = 318
        $0.tableHeaderView = homeTableHeaderView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        setupView()

    }
    
    private func setupView() {
        self.view.addSubview(homeTableView)
        homeTableView.pin.all()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let emojiLabel = UILabel()
        var headerText: String = ""
        
        if section == 0 {
            headerText = "🔥 이번 주 HOT 게시글!"
        } else {
            headerText = "🌟 이번 주 최신글"
        }
        
        emojiLabel.attributedText = .attributeFont(font: .heading18, text: headerText)
        headerView.addSubview(emojiLabel)
        emojiLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .white
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 26
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let identifier = "\(indexPath.row)"
            
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
                return reuseCell
            }
            
            let cell = HomeTrendPostTableViewCell(reuseIdentifier: identifier)
            cell.selectionStyle = .none
            
            return cell
        } else {
            let identifier = "\(indexPath.row)"
            
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
                return reuseCell
            }
            
            let cell = PostTableViewCell(reuseIdentifier: identifier)
            cell.selectionStyle = .none
            
            return cell
        }
    }
}
