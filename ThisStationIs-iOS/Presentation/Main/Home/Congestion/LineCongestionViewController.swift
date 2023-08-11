//
//  LineCongestionViewController.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/04.
//

import UIKit

class LineCongestionViewController: UIViewController {
    
    enum CongestionType {
        // 여유
        case margin
        // 보통
        case normal
        // 주의
        case caution
        // 혼잡
        case rush
    }
    
    let leftDirectionButton = UIButton().then {
        $0.frame = .init(x: 0, y: 0, width: UIScreen.width / 2, height: 48)
        $0.setAttributedTitle(.attributeFont(font: .body16, text: "강남구청 방면"), for: .normal)
        $0.backgroundColor = .white
    }
    
    let rightDirectionButton = UIButton().then {
        $0.frame = .init(x: 0, y: 0, width: UIScreen.width / 2, height: 48)
        $0.setAttributedTitle(.attributeFont(font: .body16, text: "논현 방면"), for: .normal)
        $0.backgroundColor = .white
    }
    
    let leftDestinationLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "대화행")
    }
    
    let rightDestinationLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "대화행")
    }
    
    let leftTimeLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "13:47")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    let rightTimeLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "13:50")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    let thisTrainLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "이번 열차")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    let nextTrainLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body16, text: "다음 열차")
        $0.textColor = AppColor.setupColor(.textSub)
    }
    
    let thisTrainView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let nextTrainView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let congestionInfoView = UIView()
    
    let accentGoodLineView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.accentGood)
    }
    
    let accentGoodLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "여유")
        $0.textColor = AppColor.setupColor(.accentGood)
    }
    
    let accentNormalLineView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.accentNormal)
    }
    
    let accentNormalLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "보통")
        $0.textColor = AppColor.setupColor(.accentNormal)
    }
    
    let accentWarningLineView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.accentWarning)
    }
    
    let accentWarningLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "주의")
        $0.textColor = AppColor.setupColor(.accentWarning)
    }
    
    let accentDangerLineView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.accentDanger)
    }
    
    let accentDangerLabel = UILabel().then {
        $0.attributedText = .attributeFont(font: .body14, text: "혼잡")
        $0.textColor = AppColor.setupColor(.accentDanger)
    }
    
    var thisTrainViewArray: [UIView] = []
    var nextTrainViewArray: [UIView] = []
    var totalTrainCount = 10
    var ratioLeftMargin = (UIScreen.width / 390) * 24
    var dummyCongestionArray: [CongestionType] = [.normal, .normal, .margin, .normal, .caution, .caution, .rush, .normal, .rush, .rush]
    var dummyNextCongestionArray: [CongestionType] = [.normal, .normal, .rush, .normal, .caution, .caution, .rush, .normal, .rush, .rush]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "학동역 칸별 혼잡도"
        
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "back_arrow")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(selectLeftBarButton))
        leftBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        setUpView()
    }
    
    @objc func selectLeftBarButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setUpView() {
        [
            leftDirectionButton,
            rightDirectionButton,
            leftDestinationLabel,
            rightDestinationLabel,
            leftTimeLabel,
            rightTimeLabel,
            thisTrainLabel,
            nextTrainLabel,
            thisTrainView,
            nextTrainView,
            congestionInfoView
        ].forEach {
            self.view.addSubview($0)
        }
        
        // 이번 열차 뷰 세팅
        for i in 0..<totalTrainCount {
            let trainImageView = UIImageView()
            trainImageView.image = UIImage(named: i == 0 ? "first_place" : "place")?.withRenderingMode(.alwaysTemplate)
            
            // 혼잡도에 따라 색 설정
            trainImageView.tintColor = setCongsetionColor(type: dummyCongestionArray[i])
            
            let trainNumber = UILabel()
            trainNumber.attributedText = .attributeFont(font: .body14, text: "\(i + 1)")
            trainNumber.textColor = .white
            trainImageView.addSubview(trainNumber)
            trainNumber.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
            
            thisTrainViewArray.append(trainImageView)
        }
        
        thisTrainViewArray.forEach {
            thisTrainView.addSubview($0)
        }
        
        // 다음 열차 뷰 세팅
        for i in 0..<totalTrainCount {
            let trainImageView = UIImageView()
            trainImageView.image = UIImage(named: i == 0 ? "first_place" : "place")?.withRenderingMode(.alwaysTemplate)
            
            // 혼잡도에 따라 색 설정
            trainImageView.tintColor = setCongsetionColor(type: dummyNextCongestionArray[i])
            
            let trainNumber = UILabel()
            trainNumber.attributedText = .attributeFont(font: .body14, text: "\(i + 1)")
            trainNumber.textColor = .white
            trainImageView.addSubview(trainNumber)
            trainNumber.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
            
            nextTrainViewArray.append(trainImageView)
        }
        
        nextTrainViewArray.forEach {
            nextTrainView.addSubview($0)
        }
        
        [
            accentGoodLineView,
            accentGoodLabel,
            accentNormalLineView,
            accentNormalLabel,
            accentWarningLineView,
            accentWarningLabel,
            accentDangerLineView,
            accentDangerLabel
        ].forEach {
            congestionInfoView.addSubview($0)
        }

        setUpLayout()
    }
    
    private func setUpLayout() {
        
        leftDirectionButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(8)
            $0.leading.equalToSuperview()
            $0.height.equalTo(48)
            $0.width.equalTo(UIScreen.width / 2)
        }
        
        rightDirectionButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(8)
            $0.leading.equalTo(leftDirectionButton.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(48)
            $0.width.equalTo(UIScreen.width / 2)
        }
        
        leftDestinationLabel.snp.makeConstraints {
            $0.top.equalTo(leftDirectionButton.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        
        leftTimeLabel.snp.makeConstraints {
            $0.top.equalTo(leftDestinationLabel.snp.top)
            $0.leading.equalTo(leftDestinationLabel.snp.trailing).offset(5)
        }
        
        thisTrainLabel.snp.makeConstraints {
            $0.top.equalTo(leftDestinationLabel.snp.top)
            $0.trailing.equalToSuperview().inset(24)
        }
       
        for i in 0..<thisTrainViewArray.count {
            if i == 0 {
                thisTrainViewArray[i].snp.makeConstraints {
                    $0.top.equalToSuperview()
                    $0.leading.equalToSuperview()
                }
            } else {
                thisTrainViewArray[i].snp.makeConstraints {
                    $0.leading.equalTo(thisTrainViewArray[i - 1].snp.trailing).offset(4)
                    $0.top.equalToSuperview()
                }
            }
        }
        
        thisTrainView.snp.makeConstraints {
            $0.top.equalTo(thisTrainLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(thisTrainViewArray[0].snp.leading)
            $0.trailing.equalTo(thisTrainViewArray[thisTrainViewArray.count - 1].snp.trailing)
            $0.bottom.equalTo(thisTrainViewArray[0].snp.bottom)
        }
        
        rightDestinationLabel.snp.makeConstraints {
            $0.top.equalTo(thisTrainView.snp.bottom).offset(38)
            $0.leading.equalToSuperview().inset(24)
        }
        
        rightTimeLabel.snp.makeConstraints {
            $0.top.equalTo(rightDestinationLabel.snp.top)
            $0.leading.equalTo(rightDestinationLabel.snp.trailing).offset(5)
        }
        
        nextTrainLabel.snp.makeConstraints {
            $0.top.equalTo(rightDestinationLabel.snp.top)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        for i in 0..<nextTrainViewArray.count {
            if i == 0 {
                nextTrainViewArray[i].snp.makeConstraints {
                    $0.top.equalToSuperview()
                    $0.leading.equalToSuperview()
                }
            } else {
                nextTrainViewArray[i].snp.makeConstraints {
                    $0.leading.equalTo(nextTrainViewArray[i - 1].snp.trailing).offset(4)
                    $0.top.equalToSuperview()
                }
            }
        }
        
        nextTrainView.snp.makeConstraints {
            $0.top.equalTo(nextTrainLabel.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(nextTrainViewArray[0].snp.leading)
            $0.trailing.equalTo(nextTrainViewArray[nextTrainViewArray.count - 1].snp.trailing)
            $0.bottom.equalTo(nextTrainViewArray[0].snp.bottom)
        }
        
        accentGoodLabel.snp.makeConstraints {
            $0.leading.equalTo(accentGoodLineView.snp.trailing).offset(4)
            
        }
        
        accentGoodLineView.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.width.equalTo(24)
            $0.leading.equalToSuperview()
            $0.centerY.equalTo(accentGoodLabel)
        }
        
        accentNormalLabel.snp.makeConstraints {
            $0.leading.equalTo(accentNormalLineView.snp.trailing).offset(4)
        }
        
        accentNormalLineView.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.width.equalTo(24)
            $0.leading.equalTo(accentGoodLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(accentNormalLabel)
        }
        
        accentWarningLabel.snp.makeConstraints {
            $0.leading.equalTo(accentWarningLineView.snp.trailing).offset(4)
        }
        
        accentWarningLineView.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.width.equalTo(24)
            $0.leading.equalTo(accentNormalLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(accentWarningLabel)
        }
        
        accentDangerLabel.snp.makeConstraints {
            $0.leading.equalTo(accentDangerLineView.snp.trailing).offset(4)
        }
        
        accentDangerLineView.snp.makeConstraints {
            $0.height.equalTo(4)
            $0.width.equalTo(24)
            $0.leading.equalTo(accentWarningLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(accentDangerLabel)
        }
        
        congestionInfoView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nextTrainView.snp.bottom).offset(46)
            $0.leading.equalTo(accentGoodLineView.snp.leading)
            $0.trailing.equalTo(accentDangerLabel.snp.trailing)
        }
        
    }
    
    func setCongsetionColor(type: CongestionType) -> UIColor {
        switch type {
        case .margin:
            return AppColor.setupColor(.accentGood)
        case .normal:
            return AppColor.setupColor(.accentNormal)
        case .caution:
            return AppColor.setupColor(.accentWarning)
        case .rush:
            return AppColor.setupColor(.accentDanger)
        }
    }
}
