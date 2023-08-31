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
    }
    
    var coordinator: WrittingCoordinator?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "게시글 작성"
        setupRightBarButtonItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}

extension WriteCommunityViewController {
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
        return UITableViewCell()
    }
}
