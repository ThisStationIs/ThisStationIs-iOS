//
//  HistoryViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/04/17.
//

import UIKit
import Then
import SnapKit

enum CellType {
    case isData
    case noData
}

class HistoryViewController: UIViewController {
    private let trashButton = UIBarButtonItem(image: UIImage(named: "trash"), style: .plain, target: self, action: #selector(trashButtonTapped))
    
    private let historyTableView = UITableView().then {
        $0.register(NoticeNoDataTableViewCell.self, forCellReuseIdentifier: "NoticeNoDataTableViewCell")
        $0.register(NoticeNewCommentCell.self, forCellReuseIdentifier: "NoticeNewCommentCell")
    }
    
    var cellType: CellType = .isData
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "알림"
        setupNavigationBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayout()
    }
    
    @objc
    func trashButtonTapped() {
        
    }
}

extension HistoryViewController {
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(historyTableView)
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    private func setupLayout(){
        historyTableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupNavigationBarItem() {
        navigationItem.rightBarButtonItem = trashButton
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellType == .noData ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellType == .noData ? setupReuseNoDataCell(tableView, cellForRowAt: indexPath) : setupReuseIsDataCell(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellType == .noData ? tableView.frame.height : 102
    }
    
    func setupReuseNoDataCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeNoDataTableViewCell", for: indexPath) as! NoticeNoDataTableViewCell
        cell.setupText(text: "알림이 존재하지 않습니다.")
        return cell
    }
    
    func setupReuseIsDataCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeNewCommentCell", for: indexPath) as! NoticeNewCommentCell
        return cell
    }
}
