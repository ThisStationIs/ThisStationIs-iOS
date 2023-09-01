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
        $0.register(WriteCommunityTitleTableViewCell.self, forCellReuseIdentifier: "WriteCommunityTitleTableViewCell")
        $0.register(WriteCommunityContentsTableViewCell.self, forCellReuseIdentifier: "WriteCommunityContentsTableViewCell")
    }
    
    var coordinator: WrittingCoordinator?
    var viewModel: CommunityViewModel!
    
    var selectCategory: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "게시글 작성"
        setupRightBarButtonItem()
        setupTabBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainTableView.reloadData()
    }
    
    init(viewModel: CommunityViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

        let rightBarItemForSetting = UIBarButtonItem(image: tintedImage, style: .plain, target: self, action: #selector(selectUploadPost))
        navigationItem.rightBarButtonItem = rightBarItemForSetting
    }
    
    func categorySelectAction(title: String, tag: Int) {
        selectCategory = title
    }
}

extension WriteCommunityViewController {
    @objc func selectUploadPost() {
        // 업로드
        let titleCell = mainTableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! WriteCommunityTitleTableViewCell
        let titleText = titleCell.getText()
        
        let contentCell = mainTableView.cellForRow(at: IndexPath(row: 3, section: 0)) as! WriteCommunityContentsTableViewCell
        let contentText = contentCell.getText()
        
        let postModel = PostModel(idx: postDummyData.last!.idx + 1, userName: "모험적인 길잡이", writeDate: Date().dateToString(), category: selectCategory, subway: viewModel.selectedLineArray.first ?? "", title: titleText, content: contentText)
        
        postDummyData.append(postModel)
//
        print(postModel)
        
        let detailCommunityViewController = DetailCommunityViewController(postData: postModel)
        detailCommunityViewController.hidesBottomBarWhenPushed = true
        detailCommunityViewController.dummyCommentData = []
        self.navigationController?.pushViewController(detailCommunityViewController, animated: true)
    }
}

extension WriteCommunityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectLineTableVewCell") as! SelectLineTableVewCell
            cell.setLine = viewModel.selectedLineArray.first ?? "호선을 선택해주세요."
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTagTableViewCell") as! SelectTagTableViewCell
            cell.selectionStyle = .none
            cell.categorySelectAction = categorySelectAction
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WriteCommunityTitleTableViewCell") as! WriteCommunityTitleTableViewCell
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WriteCommunityContentsTableViewCell") as! WriteCommunityContentsTableViewCell
            cell.selectionStyle = .none
            return cell
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
        case 2:
            return 56
        default:
            return UIScreen.main.bounds.height - 88 - 128 - 56
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if row == 0 {
            let nextVC = SelectSubwayLineViewController(viewModel: viewModel)
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
