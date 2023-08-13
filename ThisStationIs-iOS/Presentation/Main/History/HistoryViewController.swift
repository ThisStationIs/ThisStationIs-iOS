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
    private let historyTableView = UITableView().then {
        $0.register(NoticeNoDataTableViewCell.self, forCellReuseIdentifier: "NoticeNoDataTableViewCell")
    }
    
    var cellType: CellType = .isData
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "알림"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupLayout()
    }
}

extension HistoryViewController {
    private func setupView(){
        view.addSubview(historyTableView)
        historyTableView.backgroundColor = .yellow
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    private func setupLayout(){
        historyTableView.pin.top(view.safeAreaInsets.top) // 네비게이션 바 아래로 상단 여백을 설정합니다.
            .all() // 나머지 영역을 화면 상하좌우에 맞춥니다.
        
        view.flex.direction(.column).define { flex in
            flex.addItem(historyTableView)
                .grow(1)
            // tableViewA를 화면 전체 영역에 늘어나도록 설정합니다.
        }
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellType == .noData ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeNoDataTableViewCell", for: indexPath) as! NoticeNoDataTableViewCell
        cell.setupText(text: "알림이 존재하지 않습니다.")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellType == .noData ? tableView.frame.height : 102
    }
}
