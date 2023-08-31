//
//  WriteCommunityViewController.swift
//  ThisStationIs-iOS
//
//  Created by Muzlive_Player on 2023/08/31.
//

import UIKit

class WriteCommunityViewController: UIViewController {
    lazy var mainTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.estimatedRowHeight = 72
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        
        $0.register(SelectLineTableVewCell.self, forCellReuseIdentifier: "SelectLineTableVewCell")
        $0.register(SelectTagTableViewCell.self, forCellReuseIdentifier: "SelectTagTableViewCell")
    }
    
    var coordinator: WrittingCoordinator?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "게시글 작성"
        setupRightBarButtonItem()
        setupTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
}

extension WriteCommunityViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(mainTableView)
    }
    
    private func setupLayout() {
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupTabBar() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    private func setupRightBarButtonItem() {
        guard let originalImage = UIImage(named: "send") else { return }
        
        let resizedImage = originalImage.resized(to: CGSize(width: 24, height: 24))
        
        let tintedImage = resizedImage?.withTintColor(AppColor.setupColor(.primaryNormal), renderingMode: .alwaysOriginal)

        let rightBarItemForSetting = UIBarButtonItem(image: tintedImage, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightBarItemForSetting
    }
}

extension WriteCommunityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectLineTableVewCell") as! SelectLineTableVewCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTagTableViewCell") as! SelectTagTableViewCell
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        let row = indexPath.row
        switch row {
        case 0:
            return 88
        case 1:
            return 128
        default:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if row == 0 {
            let nextVC = SelectSubwayLineViewController(viewModel: CommunityViewModel())
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
