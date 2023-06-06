//
//  BottomSheetView.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/05/30.
//

import UIKit

/// BottomSheetView
class BottomSheetView: UIView {
    
    lazy var scrollView = UIScrollView().then {
        $0.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds
            .height + 490)
        $0.delegate = self
        $0.backgroundColor = .clear
    }
    
    let containerView = UIView().then {
        $0.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 490)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 40
    }
    
    let indicatorImageView = UIImageView().then {
        $0.image = UIImage(named: "indicator")
    }
    
    lazy var testButton = UIButton().then {
        $0.frame = .init(x: 0, y: 0, width: 50, height: 50)
        $0.setTitle("test", for: .normal)
        $0.addTarget(self, action: #selector(selectTestButton), for: .touchUpInside)
        $0.backgroundColor = .red
    }
    
    @objc func selectTestButton() {
        scrollView.setContentOffset(.init(x: 0, y: -490), animated: true)
    }
    
    init() {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .clear
        
        // blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        
        self.addSubview(scrollView)
        scrollView.addSubview(containerView)
    
        containerView.flex.alignContent(.center).define {
            $0.addItem(testButton).width(50).height(50)
        }
    }
    
    /// 바텀시트 열기
    func showBottomSheet() {
        if let rootViewController = UIApplication.shared.keyWindow?.visibleViewController as? UIViewController {
            rootViewController.view.addSubview(self)
            DispatchQueue.main.async {
                self.scrollView.setContentOffset(.init(x: 0, y: 0), animated: true)
            }
        }
    }
    
    /// 바텀시트 닫기
    func closeBottomSheet() {
        scrollView.setContentOffset(.init(x: 0, y: -490), animated: true)
    }
    
    override func layoutSubviews() {
        self.pin.all()
        scrollView.pin.all()
        
        // containerView 위치 조정
        containerView.pin.bottom().horizontally()
        
        scrollView.contentSize = self.frame.size
        
        // 스크롤 뷰 초기 위치 조정
        scrollView.setContentOffset(.init(x: 0, y: -490), animated: false)
    }
}

extension BottomSheetView: UIScrollViewDelegate {
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // 닫힘 상태일 경우 제거
        if scrollView.contentOffset.y <= -490 {
            self.removeFromSuperview()
        }
    }
}
