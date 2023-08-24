//
//  DetailCommunityViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/24.
//

import UIKit

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
    
    let sendButton = UIButton().then {
        $0.setImage(UIImage(named: "send"), for: .normal)
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
    
    @objc func selectLeftBarButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectRightBarButton() {
        
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
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let identifier = "\(indexPath.row)"
            
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
                return reuseCell
            }
            
            let cell = PostContentTableViewCell.init(reuseIdentifier: identifier)
            cell.selectionStyle = .none
            
            return cell
        } else {
            let identifier = "\(indexPath.row)"
            
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
                return reuseCell
            }
            
            let cell = PostCommentTableViewCell.init(reuseIdentifier: identifier)
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    
}