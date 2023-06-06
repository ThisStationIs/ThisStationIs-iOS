//
//  TextField.swift
//  ThisStationIs-iOS
//
//  Created by milli on 2023/05/15.
//

import UIKit

class TextField: UITextField {
    var padding = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)

    private var underLineView = UIView().then {
        $0.backgroundColor = AppColor.setupColor(.componentDivider)
    }

    var isError: Bool = false {
        didSet {
            if isError {
                underLineView.backgroundColor = AppColor.setupColor(.statusNegative)
            } else {
                underLineView.backgroundColor = AppColor.setupColor(.componentDivider)
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.addSubview(underLineView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        underLineView.frame = .init(x: 0, y: self.frame.height, width: self.frame.width, height: 1)
    }
}
