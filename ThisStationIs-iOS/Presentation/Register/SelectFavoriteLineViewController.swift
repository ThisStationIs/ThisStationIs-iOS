//
//  SelectFavoriteLineViewController.swift
//  ThisStationIs-iOS
//
//  Created by 뉴링크 on 2023/06/07.
//

import UIKit

class SelectFavoriteLineViewController: UIViewController {
    let mainDescriptionLabel = UILabel().then {
        $0.textColor = AppColor.setupColor(.textMain)
        $0.attributedText = .attributeFont(font: .heading24, text: "평소 이용하시는\n지하철 호선을 선택해주세요.")
        $0.numberOfLines = 0
    }
    
    let lineCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.register(LineCollectionViewCell.self, forCellWithReuseIdentifier: "LineCollectionViewCell")
    }
    
    let bottomButton = MainButton().then {
        $0.setTitle("가입 완료", for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDelegate()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayout()
    }
    
    func setupDelegate() {
        lineCollectionView.dataSource = self
        lineCollectionView.delegate = self
    }
}

extension SelectFavoriteLineViewController {
    private func setupView(){
        view.backgroundColor = .white
        
        [
            mainDescriptionLabel,
            lineCollectionView,
            bottomButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayout(){
        mainDescriptionLabel.sizeToFit()
        mainDescriptionLabel.pin.top(view.safeAreaInsets.top + 73)
            .left(24)
        
        bottomButton.pin.bottom(view.safeAreaInsets.bottom + 34)
            .horizontally(24)
            .height(60)
        
        lineCollectionView.pin
            .below(of: mainDescriptionLabel)
            .above(of: bottomButton)
            .horizontally(24)
            .marginTop(40)
            .marginBottom(97)
    }
}

extension SelectFavoriteLineViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LineCollectionViewCell", for: indexPath) as! LineCollectionViewCell
        cell.setupAttribute(bgColor: AppColor.setupColor(.statusPositive), txtColor: .white)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns: CGFloat = 3
        
        let spacingBetweenCells: CGFloat = 9
        let totalSpacing: CGFloat = (numberOfColumns - 1) * spacingBetweenCells
        
        let availableWidth = collectionView.frame.width - totalSpacing
        let cellWidth = availableWidth / numberOfColumns
        
        let cellHeight: CGFloat = 48
        
        let layout = collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumInteritemSpacing = spacingBetweenCells
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
