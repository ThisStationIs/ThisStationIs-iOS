//
//  CongestionSearchLineViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/04.
//

import UIKit

class CongestionSearchLineViewController: UIViewController {
    
    let searchBar = UISearchBar().then {
        $0.placeholder = "역명 검색"
        $0.setImage(UIImage(), for: .search, state: .normal)
        $0.setImage(UIImage(named: "search"), for: .clear, state: .normal)
    }
    
    lazy var searchLineTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.backgroundColor = .white
        $0.separatorStyle = .none
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "역 검색"
        
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "back_arrow")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(selectLeftBarButton))
        leftBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        setUpView()
        setUpLayout()
    }
    
    @objc func selectLeftBarButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setUpView() {
        [
            searchBar,
            searchLineTableView,
        ].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setUpLayout() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        searchLineTableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension CongestionSearchLineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let headerLabel = UILabel()
        headerLabel.attributedText = .attributeFont(font: .heading18, text: "검색기록")
        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "\(indexPath.row)"
        
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        cell.selectionStyle = .none
        
        let subwayLineView = SubwayLineView()
        cell.contentView.addSubview(subwayLineView)
        subwayLineView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
        }
        
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(named: "delete"), for: .normal)
        cell.contentView.addSubview(deleteButton)
        deleteButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(24)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lineCongestionViewController = LineCongestionViewController()
        self.navigationController?.pushViewController(lineCongestionViewController, animated: true)
    }
}
