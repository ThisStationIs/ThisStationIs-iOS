//
//  DetailCommunityViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/24.
//

import UIKit
import IQKeyboardManagerSwift

class DetailCommunityViewCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    var finishDelegate: CoordinatorFinishDelegate?
    weak var parentCoordinator: CommunityCoordinator?
    
    var type: CoordinatorType = .community
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("start")
//        self.navigationController.pushViewController(DetailCommunityViewController(), animated: true)
    }
    
    func start(postData: PostModel) {
        let detailCommunityViewController = DetailCommunityViewController(postData: postData)
        detailCommunityViewController.coordinator = self
        navigationController.pushViewController(detailCommunityViewController, animated: true)
    }
}

class DetailCommunityViewController: BaseUIViewController {
    
    lazy var contentTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.estimatedRowHeight = 72
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
    }
    
    let bottomView = UIView().then {
        $0.frame = .init(x: 0, y: 0, width: UIScreen.width, height: 98)
        $0.backgroundColor = .white
    }
    
    let commentTextField = CommentTextField().then {
        $0.placeholder = "댓글을 입력하세요."
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 48 / 2
        $0.backgroundColor = AppColor.setupColor(.componentTextbox)
    }
    
    lazy var sendButton = UIButton().then {
        $0.setImage(UIImage(named: "send"), for: .normal)
        $0.addTarget(self, action: #selector(selectSendButton), for: .touchUpInside)
    }
    
    var postData: PostModel?
    var dummyCommentData = commentDummyData
    var coordinator: Coordinator?
    
    init(postData: PostModel) {
        super.init(nibName: nil, bundle: nil)
        self.postData = postData
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.hidesBarsOnSwipe = false
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "back_arrow")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(selectLeftBarButton))
        leftBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "menu"), style: .plain, target: self, action: #selector(selectRightBarButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        IQKeyboardManager.shared.enable = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        IQKeyboardManager.shared.enable = true
    }
    
    @objc func selectLeftBarButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectRightBarButton() {
        
    }
    
    @objc func selectSendButton() {
        guard
            let text = commentTextField.text,
            !text.isEmpty
        else { return }
        
        let commentInfo = CommentModel(idx: dummyCommentData.last!.idx + 1, userName: "모험적인 길잡이", writeDate: Date().dateToString(), comment: text)
        dummyCommentData.append(commentInfo)
        
        contentTableView.reloadData()
        
        commentTextField.text = ""
    }
     
    private func setUpView() {
        self.view.addSubview(contentTableView)
        self.view.addSubview(bottomView)
        
        [
            commentTextField,
            sendButton,
        ].forEach {
            bottomView.addSubview($0)
        }
        
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        contentTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(98)
        }
        
        bottomView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(98)
        }
        
        commentTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(56)
            $0.height.equalTo(48)
        }
        
        sendButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(21)
            $0.trailing.equalToSuperview().inset(24)
            $0.width.height.equalTo(24)
        }
    }
}

extension DetailCommunityViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return dummyCommentData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let postData = postData else { return UITableViewCell() }
            let identifier = "\(indexPath.row) \(postData.idx)"
            
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
                return reuseCell
            }
            
            let cell = PostContentTableViewCell.init(reuseIdentifier: identifier, postData: postData)
            cell.selectionStyle = .none
            
            return cell
        } else {
            let commentData = dummyCommentData[indexPath.row]
            let identifier = "\(indexPath.row) \(commentData.idx)"
            
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
                return reuseCell
            }
            
            let cell = PostCommentTableViewCell.init(reuseIdentifier: identifier, commentData: commentData)
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    
}
