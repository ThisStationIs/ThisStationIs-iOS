//
//  CommunityViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/04/17.
//

import UIKit

protocol CommunityDelegate: AnyObject {
    func pushDetailViewController(postData: PostModel)
}

class CommunityViewController: BaseUIViewController {
    
    let searchBar = UISearchBar().then {
        $0.placeholder = "찾으시는게 있나요?"
        $0.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysTemplate), for: .search, state: .normal)
        $0.tintColor = AppColor.setupColor(.textSub)
    }
    
    lazy var boardTableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.separatorInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        $0.estimatedRowHeight = 318
        $0.rowHeight = UITableView.automaticDimension
    }
    
    lazy var titleView = UIView().then {
        $0.backgroundColor = .white
        $0.addGestureRecognizer(self.titleViewGeusture)
    }
    
    let titleLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .heading20, text: "내 게시판")
    }
    
    let rightArrowImageView = UIImageView().then {
        $0.image = UIImage(named: "right_arrow")
    }
    
    let categoryScrollView = UIScrollView().then {
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
    }
    
    var dummyLine: [String] = ["1", "2", "8", "수", "인"]
    var categoryTitleString: [String] = ["전체", "연착정보", "분실물", "사건사고", "알쓸신잡", "질문", "기타"]
    lazy var titleViewGeusture = UITapGestureRecognizer(target: self, action: #selector(tapTitleView))
    
    var lineIconViewArray: [UIView] = []
    var categoryViewArray: [BadgeView] = []
    
    var dummyPostData = postDummyData
    
    let viewModel = CommunityViewModel()
    var coordinator: CommunityCoordinator?
    weak var delegate: CommunityDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpLineView()
    }
    
    @objc func tapTitleView(_ gesture: UITapGestureRecognizer) {
        let selectSubwayLineViewController = SelectSubwayLineViewController(viewModel: viewModel)
        selectSubwayLineViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(selectSubwayLineViewController, animated: true)
    }
     
    @objc func selectRightButton() {
        //
//        dummyLine = ["4", "5"]
//        setUpLineView()
    }
    
    @objc func selectBadgeTapGesture(_ sender: UIGestureRecognizer) {
        guard let badgeView = sender.view as? BadgeView else { return }
        badgeView.isSelect.toggle()
        
        badgeView.isSelect ? viewModel.addSelectCategory(category: categoryTitleString[badgeView.tag], tag: badgeView.tag) : viewModel.removeSelectCategory(category: categoryTitleString[badgeView.tag], tag: badgeView.tag)
        
        // 태그가 첫번째 태그를 선택한게 아니면 첫번째 태그 삭제
        if badgeView.tag == 0 {
            categoryViewArray.forEach { $0.isSelect = false }
            categoryViewArray[0].isSelect = true
        } else {
            categoryViewArray[0].isSelect = false
        }
    }
    
    private func setUpNavigationBar() {
        self.navigationController?.hidesBarsOnSwipe = true
        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.backgroundColor = .white
        
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "sort_icon")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(selectRightButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func setUpView() {
        [
            titleView,
            categoryScrollView,
            boardTableView
        ].forEach {
            self.view.addSubview($0)
        }
        
        [
            titleLabel,
            rightArrowImageView,
        ].forEach {
            titleView.addSubview($0)
        }
        
        // 선택한 호선 뷰 세팅
        setUpLineView()
        
        // 카테고리 뷰 세팅
        for i in 0..<categoryTitleString.count {
            let badgeView = BadgeView(size: .large, type: .solid)
            badgeView.tag = i
            badgeView.text = .attributeFont(font: .body14, text: categoryTitleString[i])
            badgeView.outlineColor = AppColor.setupColor(.primaryNormal)
            badgeView.textColor = AppColor.setupColor(.primaryNormal)
            badgeView.isSelect = i == 0 ? true : false
            
            let badgeTapGesture = UITapGestureRecognizer(target: self, action: #selector(selectBadgeTapGesture))
            badgeView.addGestureRecognizer(badgeTapGesture)
            
            categoryViewArray.append(badgeView)
        }
        
        categoryViewArray.forEach { categoryScrollView.addSubview($0) }
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().inset(24)
        }
        
        titleView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(titleLabel.snp.bottom).inset(-16)
        }
        
        rightArrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
        }
        
        categoryScrollView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
        }
        
        for i in 0..<categoryViewArray.count {
            if i == 0 {
                categoryViewArray[i].snp.makeConstraints {
                    $0.leading.equalToSuperview().inset(24)
                    $0.top.bottom.equalToSuperview().inset(4)
                }
            } else if i == categoryViewArray.count - 1 {
                categoryViewArray[i].snp.makeConstraints {
                    $0.leading.equalTo(categoryViewArray[i - 1].snp.trailing).offset(8)
                    $0.top.bottom.equalToSuperview().inset(4)
                    $0.trailing.equalToSuperview().inset(24)
                }
            } else {
                categoryViewArray[i].snp.makeConstraints {
                    $0.leading.equalTo(categoryViewArray[i - 1].snp.trailing).offset(8)
                    $0.top.bottom.equalToSuperview().inset(4)
                }
            }
        }
        
        boardTableView.snp.makeConstraints {
            $0.top.equalTo(categoryScrollView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    /// 선택한 호선 세팅
    /// 추후 변경되기 때문에 뷰 삭제 후 다시 그리기 위해 따로 뺴둠
    private func setUpLineView() {
        // 상위 뷰에서 삭제 후 다시 그려주기
        lineIconViewArray.forEach { $0.removeFromSuperview() }
        lineIconViewArray = []
        dummyPostData = postDummyData
        
        for i in 0..<viewModel.selectedLineArray.count {
            let lineView = SubwayLineView(type: .icon)
            let firstIndex = viewModel.selectedLineArray[i].startIndex
//            lineView.setLineName = "\(viewModel.selectedLineArray[i][firstIndex])"
            lineView.lineLabel.attributedText = .attributeFont(font: .content, text:"\(viewModel.selectedLineArray[i][firstIndex])")
            lineView.setLineColor = AppColor.setupLineColor(viewModel.selectedLineArray[i])
            
            lineIconViewArray.append(lineView)
        }
        
        lineIconViewArray.forEach { titleView.addSubview($0) }
        
        for i in 0..<lineIconViewArray.count {
            if i == 0 {
                lineIconViewArray[i].snp.makeConstraints {
                    $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
                    $0.centerY.equalTo(titleLabel)
                }
            } else {
                lineIconViewArray[i].snp.makeConstraints {
                    $0.leading.equalTo(lineIconViewArray[i - 1].snp.trailing).offset(8)
                    $0.centerY.equalTo(titleLabel)
                }
            }
        }
        
        if viewModel.selectedLineArray.count > 0 {
            // 필터가 변경된 대로 게시글 보여주기
            dummyPostData = dummyPostData.filter({ value in
                viewModel.selectedLineArray.contains(value.subway)
            })
        }
        
        self.boardTableView.reloadData()
    }
}
 
extension CommunityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyPostData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postData = dummyPostData[indexPath.row]
        let identifier = "\(indexPath.row) \(postData.idx)"
        
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
            return reuseCell
        }
        
        let cell = PostTableViewCell(reuseIdentifier: identifier, postData: postData)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        delegate?.pushDetailViewController(postData: dummyPostData[indexPath.row])
        
        let detailCommunityViewController = DetailCommunityViewController(postData: dummyPostData[indexPath.row])
        detailCommunityViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailCommunityViewController, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //
    }
}
