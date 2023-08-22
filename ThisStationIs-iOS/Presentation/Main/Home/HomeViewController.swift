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
        $0.setCongestionAction = self.setCongestionAction
    }
    
    lazy var homeTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        $0.estimatedRowHeight = 318
        $0.tableHeaderView = homeTableHeaderView
    }
    
    let searchBar = UISearchBar().then {
        $0.placeholder = "키워드를 검색해보세요"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    @objc func selectSearchTapGesture() {
       
    }
    
    func setCongestionAction() {
        let congestionSearchLineViewController = CongestionSearchLineViewController()
        congestionSearchLineViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(congestionSearchLineViewController, animated: true)
    }
    
    private func setupView() {
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.backgroundColor = .white
        let searchTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectSearchTapGesture))
        searchBar.addGestureRecognizer(searchTapGesture)
        
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

extension UIView {
  func makeSecure() {
    DispatchQueue.main.async {
      let textField = UITextField()
      textField.isSecureTextEntry = true
      
      self.addSubview(textField)
      textField.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
      textField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
      
      // 캡쳐하려는 뷰의 레이어를 textField.layer 사이에 끼워넣기
      textField.layer.removeFromSuperlayer() // 이 코드가 없으면 run time error (layer 참조 관계에 cycle이 생성되므로)
      self.layer.superlayer?.insertSublayer(textField.layer, at: 0)
      textField.layer.sublayers?.last?.addSublayer(self.layer)
    }
  }
}
