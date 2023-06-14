//
//  HomeViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/04/17.
//

import UIKit

class HomeViewController: UIViewController {

    lazy var homeTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.estimatedRowHeight = 318
        $0.rowHeight = UITableView.automaticDimension
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
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(indexPath.row)"
        
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
            return reuseCell
        }
        
        let cell = PostTableViewCell(reuseIdentifier: identifier)
        
        return cell
    }
}
